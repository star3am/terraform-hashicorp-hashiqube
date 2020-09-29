variable "deploy_to_aws" {}

variable "deploy_to_azure" {}

variable "deploy_to_gcp" {}

variable "azure_hashiqube_ip" {}

variable "gcp_hashiqube_ip" {}

variable "whitelist_cidr" {}

variable "my_ipaddress" {}

variable "vault" {
  type = map
  description = "vault configuration"
  default = {
    enabled = true
    version = "latest"
  }
}

variable "aws_credentials" {
  type        = string
  default     = ""
  description = "AWS credentials file location"
}

variable "aws_profile" {
  type        = string
  default     = "default"
  description = "AWS profile"
}

variable "aws_region" {
  type        = string
  default     = "ap-southeast-2"
  description = "AWS region"
}

variable "aws_instance_type" {
  type        = string
  default     = "t2.medium"
  description = "AWS instance type"
}

variable "ssh_public_key" {
  type        = string
  default     = ""
  description = "SSH public key that HashiQube will be bootstrapped with"
}

variable "whitelist" {
  type        = string
  default     = ""
  description = "Whitelisted CIDRs"
}
