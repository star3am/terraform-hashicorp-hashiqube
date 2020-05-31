variable "location" {
  default     = "gcp"
  description = "Cloud where HashiQube will run"
}

variable "whitelist" {
  default     = ""
  description = "Whitelisted CIDRs"
}