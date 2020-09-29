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

variable "whitelist_cidr" {
  description = "Additional CIDR to whitelist"
  type        = string
  default     = "" # Example: 0.0.0.0/0
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

variable "gcp_project" {
  default     = "thermal-formula-256223"
  description = "GCP project ID"
}

variable "gcp_region" {
  description = "The region in which all GCP resources will be launched"
  default     = "australia-southeast1"
}