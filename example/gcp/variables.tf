variable "whitelist" {
  default     = ""
  description = "Whitelisted CIDRs"
}

variable "gcp_project" {
  default     = ""
  description = "GCP project ID"
}

variable "gcp_cluster_name" {
  default     = "hashiqube"
  description = "Cluster name"
}

variable "gcp_cluster_description" {
  default     = "hashiqube"
  description = "the description for the cluster"
}

variable "gcp_cluster_tag_name" {
  default     = "hashiqube"
  description = "cluster tag to apply"
}

variable "gcp_cluster_size" {
  default     = 1
  description = "size of the cluster"
}

variable "gcp_region" {
  default     = "australia-southeast1"
  description = "The region in which all GCP resources will be launched"
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
  default = "n1-standard-1"
}

variable "gcp_custom_metadata" {
  description = "A map of metadata key value pairs to assign to the Compute Instance metadata"
  type        = map(string)
  default     = {}
}

variable "gcp_root_volume_disk_size_gb" {
  description = "The size, in GB, of the root disk volume on each Consul node"
  default     = 16
}

variable "gcp_root_volume_disk_type" {
  description = "The GCE disk type. Can be either pd-ssd, local-ssd, or pd-standard"
  default     = "pd-standard"
}
