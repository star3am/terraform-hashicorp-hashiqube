variable "location" {
  default     = "aws"
  description = "Cloud where HashiQube will run"
}

variable "whitelist" {
  default     = ""
  description = "Whitelisted CIDRs"
}