# for more variables see variables.tf in main folder

variable "deploy_to_aws" {
  type        = bool
  default     = true
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
  description = "Debug and Output User Data progress"
}

variable "ssh_public_key" {
  type        = string
  description = "Content of your SSH public key, matching the private key below"
}

variable "ssh_private_key" {
  type        = string
  description = "Content of your SSH private key, matching the public key above"
  sensitive   = true
}
