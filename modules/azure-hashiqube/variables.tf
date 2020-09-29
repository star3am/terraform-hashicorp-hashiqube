variable "deploy_to_aws" {}

variable "deploy_to_azure" {}

variable "deploy_to_gcp" {}

variable "aws_hashiqube_ip" {}

variable "gcp_hashiqube_ip" {}

variable "whitelist_cidr" {}

variable "my_ipaddress" {}

variable "ssh_public_key" {
  type        = string
  default     = ""
  description = "SSH public key that HashiQube will be bootstrapped with"
}

variable "vault" {
  type = map
  description = "vault configuration"
  default = {
    enabled = true
    version = "latest"
  }
}