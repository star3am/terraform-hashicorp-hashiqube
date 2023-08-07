variable "deploy_to_aws" {
  type        = bool
  default     = false
  description = "Deploy Hashiqube on AWS"
}

variable "deploy_to_gcp" {
  type        = bool
  default     = false
  description = "Deploy Hashiqube on GCP"
}

variable "deploy_to_azure" {
  type        = bool
  default     = false
  description = "Deploy Hashiqube on Azure"
}

variable "debug_user_data" {
  type        = bool
  default     = true
  description = "Debug Output the User Data of the Cloud instance during Terraform Apply"
}

variable "azure_hashiqube_ip" {
  type        = string
  default     = null
  description = "Azure Hahiqube IP address"
}

variable "gcp_hashiqube_ip" {
  type        = string
  default     = null
  description = "GCP Hahiqube IP address"
}

variable "whitelist_cidr" {
  description = "Additional CIDR to whitelist"
  type        = string
  default     = "20.191.210.171/32" # Example: 0.0.0.0/0
}

variable "ssh_public_key" {
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQ......"
  description = "Path to your SSH public key, matching the private key below"
}

variable "ssh_private_key" {
  type        = string
  default     = "~/.ssh/id_rsa" #tfsec:ignore:general-secrets-sensitive-in-variable
  description = "Path to your SSH private key, matching the public key above"
  sensitive   = true
}

variable "my_ipaddress" {
  type        = string
  default     = null
  description = "Your Public IP address"
}

# You can find the full list of provisioners in the Vagrantfile
variable "vagrant_provisioners" {
  description = "The list of services you would like to run in Hashiqube, the more you run, the bigger instance youd need with more RAM"
  type        = string
  default     = "basetools,docker,consul,vault,nomad,boundary,waypoint"
}

# variable "aws_credentials" {
#   type        = string
#   default     = "~/.aws/config"
#   description = "AWS credentials file location"
# }

# variable "aws_profile" {
#   type        = string
#   default     = "default"
#   description = "AWS profile"
# }

variable "aws_region" {
  type        = string
  default     = "ap-southeast-2"
  description = "The region in which all AWS resources will be launched"
}

variable "aws_instance_type" {
  type        = string
  default     = "t2.medium"
  description = "AWS instance type"
}
