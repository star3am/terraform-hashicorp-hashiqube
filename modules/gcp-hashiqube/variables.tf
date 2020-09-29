variable "deploy_to_aws" {}

variable "deploy_to_azure" {}

variable "deploy_to_gcp" {}

variable "aws_hashiqube_ip" {}

variable "azure_hashiqube_ip" {}

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

variable "gcp_project" {
  type        = string
  default     = ""
  description = "GCP project ID"
}

variable "gcp_credentials" {
  type        = string
  default     = ""
  description = "GCP credentials file location"
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

variable "gcp_cluster_name" {
  type        = string
  default     = "hashiqube"
  description = "Cluster name"
}

variable "gcp_cluster_description" {
  type        = string
  default     = "hashiqube"
  description = "the description for the cluster"
}

variable "gcp_cluster_tag_name" {
  type        = string
  default     = "hashiqube"
  description = "Cluster tag to apply"
}

variable "gcp_cluster_size" {
  type        = number
  default     = 1
  description = "size of the cluster"
}

variable "gcp_region" {
  type        = string
  description = "The region in which all GCP resources will be launched"
  default     = "australia-southeast1"
}

variable "gcp_zones" {
  type        = list(string)
  description = "The zones accross which GCP resources will be launched"

  default = [
    "australia-southeast1-a",
    "australia-southeast1-b",
    "australia-southeast1-c",
  ]
}

variable "gcp_machine_type" {
  type    = string
  default = "n1-standard-1"
}

variable "gcp_custom_metadata" {
  description = "A map of metadata key value pairs to assign to the Compute Instance metadata"
  type        = map(string)
  default     = {}
}

variable "gcp_root_volume_disk_size_gb" {
  type        = number
  description = "The size, in GB, of the root disk volume on each HashiQube node"
  default     = 16
}

variable "gcp_root_volume_disk_type" {
  type        = string
  description = "The GCE disk type. Can be either pd-ssd, local-ssd, or pd-standard"
  default     = "pd-standard"
}
