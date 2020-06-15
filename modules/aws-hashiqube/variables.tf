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
