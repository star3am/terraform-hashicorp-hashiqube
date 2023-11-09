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

variable "debug_allow_ssh_cidr_range" {
  type        = string
  default     = ""
  description = "CAREFUL! Debug Open SSH port 22 to this CIDR range, use only in emergency"
}

variable "aws_hashiqube_ip" {
  type        = string
  default     = null
  description = "AWS Hahiqube IP address"
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
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDAd1E2uJrIFr8PVIMiGvCCdwpL2U+1HqpQ8YVbXCT104SFkYl7IArRmlY9LfGagO9xw/xcAP2gR3e3Bfo1Z4p3ZmbB0E4HqI+9MwRFS86xT9KVqH+anTgTIPAfpjCzoEHk/BMT5/Gzowkn426cMAFz1Fg+Umv9GrHkxPf2+xuoHvjYyibkvvO88lMeTojt/HjTz3QZUL361QCsZxcChAR1/DOvKygCnGEqZ2p4aBvHrEBiyHt1POQJzhtKzG4o14zmzZ5prBHFiyhFdTeqKHtYqgKVhrYPkgALLWZFcl3rSSBZpWTli3NpkfAv98aTyCrljJohUJdJkeL3RxuX6gHN"
  description = "Content of your SSH public key, matching the private key below"
}

variable "ssh_private_key" {
  type        = string
  default     = "" #tfsec:ignore:general-secrets-sensitive-in-variable
  description = "Content of your SSH private key, matching the public key above"
  sensitive   = true
}

# You can find the full list of provisioners in the Vagrantfile
variable "vagrant_provisioners" {
  description = "The list of services you would like to run in Hashiqube, the more you run, the bigger instance youd need with more RAM"
  type        = string
  default     = "basetools,docker,consul,vault,nomad,boundary,waypoint"
}

variable "azure_region" {
  type        = string
  description = "The region in which all Azure resources will be launched"
  default     = "Australia East"
}

variable "azure_instance_type" {
  type        = string
  default     = "Standard_DS1_v2"
  description = "Azure instance type"
}

variable "use_packer_image" {
  type        = bool
  default     = false
  description = "Use your own Packer build image?"
}

# https://developer.hashicorp.com/terraform/cloud-docs/api-docs/ip-ranges
variable "terraform_cloud_api_ip_ranges" {
  type = list(any)
  default = [
    "75.2.98.97/32",
    "99.83.150.238/32",
  ]
  description = "Terraform Cloud API IP Ranges"
}

variable "terraform_cloud_notifications_ip_ranges" {
  type = list(any)
  default = [
    "52.86.200.106/32",
    "52.86.201.227/32",
    "52.70.186.109/32",
    "44.236.246.186/32",
    "54.185.161.84/32",
    "44.238.78.236/32",
  ]
  description = "Terraform Cloud Notifications IP Ranges"
}
