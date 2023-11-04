# https://www.terraform.io/docs/providers/aws/r/instance.html

terraform {
  required_version = "~> 1.0"

  required_providers {
    # https://registry.terraform.io/providers/hashicorp/aws/latest
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.67"
    }
    # https://registry.terraform.io/providers/hashicorp/azurerm/latest
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
    }
  }
}

resource "null_resource" "hashiqube" {
  triggers = {
    deploy_to_aws        = var.deploy_to_aws
    deploy_to_azure      = var.deploy_to_azure
    deploy_to_gcp        = var.deploy_to_gcp
    whitelist_cidr       = var.whitelist_cidr
    my_ipaddress         = var.my_ipaddress
    region               = var.aws_region
    ssh_public_key       = var.ssh_public_key
    azure_hashiqube_ip   = var.azure_hashiqube_ip
    gcp_hashiqube_ip     = var.gcp_hashiqube_ip
    vagrant_provisioners = var.vagrant_provisioners
    timestamp            = local.timestamp
    debug_user_data      = var.debug_user_data
  }
}

locals {
  timestamp = timestamp()
}

data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}

resource "aws_iam_role" "hashiqube" {
  name               = "hashiqube"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "hashiqube" {
  name = "hashiqube"
  role = aws_iam_role.hashiqube.name
}

# tfsec:ignore:aws-iam-no-policy-wildcards
resource "aws_iam_role_policy" "hashiqube" {
  name   = "hashiqube"
  role   = aws_iam_role.hashiqube.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_instance" "hashiqube" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = var.aws_instance_type
  security_groups = [aws_security_group.hashiqube.name]
  key_name        = aws_key_pair.hashiqube.key_name
  root_block_device {
    volume_size = var.aws_instance_root_block_device_size
    volume_type = var.aws_instance_root_block_device_type
  }
  metadata_options {
    http_endpoint = "enabled"
  }
  user_data_base64 = base64gzip(templatefile("${path.module}/../../modules/shared/startup_script", {
    HASHIQUBE_AWS_IP     = aws_eip.hashiqube.public_ip
    HASHIQUBE_AZURE_IP   = var.azure_hashiqube_ip == null ? "" : var.azure_hashiqube_ip
    HASHIQUBE_GCP_IP     = var.gcp_hashiqube_ip == null ? "" : var.gcp_hashiqube_ip
    VAGRANT_PROVISIONERS = var.vagrant_provisioners
  }))
  iam_instance_profile = aws_iam_instance_profile.hashiqube.name
  tags = {
    Name = "hashiqube"
  }
}

resource "aws_key_pair" "hashiqube" {
  key_name   = "hashiqube"
  public_key = var.ssh_public_key
}

resource "aws_security_group" "hashiqube" {
  name        = "hashiqube"
  description = "Allow Your Whitelist CIDR addresses"
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["${var.my_ipaddress}/32"]
    description = "Allow Your Public IP address"
  }
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "udp"
    cidr_blocks = ["${var.my_ipaddress}/32"]
    description = "Allow Your Public IP address"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] #tfsec:ignore:aws-vpc-no-public-egress-sg
    description = "Allow Your Public IP address"
  }
}

# tfsec:ignore:aws-vpc-disallow-mixed-sgr
resource "aws_security_group_rule" "terraform_cloud_api_ip_ranges" {
  count             = var.debug_user_data == true ? 1 : 0
  description       = "Allow terraform_cloud_api_ip_ranges"
  type              = "ingress"
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = var.terraform_cloud_api_ip_ranges
  from_port         = 22
  security_group_id = aws_security_group.hashiqube.id
}

# tfsec:ignore:aws-vpc-disallow-mixed-sgr
resource "aws_security_group_rule" "terraform_cloud_notifications_ip_ranges" {
  count             = var.debug_user_data == true ? 1 : 0
  description       = "Allow var.terraform_cloud_notifications_ip_ranges"
  type              = "ingress"
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = var.terraform_cloud_notifications_ip_ranges
  from_port         = 22
  security_group_id = aws_security_group.hashiqube.id
}

resource "aws_security_group_rule" "aws_hashiqube" {
  count             = var.deploy_to_aws ? 1 : 0
  description       = "Allow Hashiqube Public IP address"
  type              = "ingress"
  to_port           = 65535
  protocol          = "all"
  cidr_blocks       = ["${aws_eip.hashiqube.public_ip}/32"]
  from_port         = 0
  security_group_id = aws_security_group.hashiqube.id
}

resource "aws_security_group_rule" "azure_hashiqube" {
  count             = var.deploy_to_azure ? 1 : 0
  description       = "Allow Azure Hashiqube Public IP address"
  type              = "ingress"
  to_port           = 65535
  protocol          = "all"
  cidr_blocks       = ["${var.azure_hashiqube_ip}/32"]
  from_port         = 0
  security_group_id = aws_security_group.hashiqube.id
}

resource "aws_security_group_rule" "gcp_hashiqube" {
  count             = var.deploy_to_gcp ? 1 : 0
  description       = "Allow GCP Hashiqube Public IP address"
  type              = "ingress"
  to_port           = 65535
  protocol          = "all"
  cidr_blocks       = ["${var.gcp_hashiqube_ip}/32"]
  from_port         = 0
  security_group_id = aws_security_group.hashiqube.id
}

# tfsec:ignore:aws-vpc-disallow-mixed-sgr
resource "aws_security_group_rule" "whitelist_cidr" {
  count             = var.whitelist_cidr != "" ? 1 : 0
  description       = "Allow Your Whitelist CIDR addresses"
  type              = "ingress"
  to_port           = 65535
  protocol          = "all"
  cidr_blocks       = [var.whitelist_cidr]
  from_port         = 0
  security_group_id = aws_security_group.hashiqube.id
}

# tfsec:ignore:aws-vpc-disallow-mixed-sgr
resource "aws_security_group_rule" "debug_allow_ssh_cidr_range" {
  count             = var.debug_allow_ssh_cidr_range != "" ? 1 : 0
  description       = "Debug Open SSH port 22 to this CIDR range"
  type              = "ingress"
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [var.debug_allow_ssh_cidr_range]
  from_port         = 22
  security_group_id = aws_security_group.hashiqube.id
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.hashiqube.id
  allocation_id = aws_eip.hashiqube.id
}

resource "aws_eip" "hashiqube" {
  vpc = true
}

resource "null_resource" "debug" {
  count = var.debug_user_data == true ? 1 : 0

  triggers = {
    timestamp = local.timestamp
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    host        = aws_eip.hashiqube.public_ip
    private_key = var.ssh_private_key
    timeout     = "10m"
  }

  provisioner "remote-exec" {
    inline = [
      # https://developer.hashicorp.com/terraform/language/resources/provisioners/remote-exec#scripts
      # See Note in the link above about: set -o errexit
      "set -o errexit",
      "while [ ! -f /var/log/user-data.log ]; do sleep 5; done;",
      "tail -f /var/log/user-data.log | { sed '/ USER-DATA END / q' && kill $$ || true; }",
      "exit 0"
    ]
    on_failure = continue
  }

  depends_on = [
    aws_instance.hashiqube,
    aws_eip_association.eip_assoc,
    aws_security_group.hashiqube
  ]
}
