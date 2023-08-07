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

variable "aws_hashiqube_ip" {
  type        = string
  default     = null
  description = "AWS Hahiqube IP address"
}

variable "azure_hashiqube_ip" {
  type        = string
  default     = null
  description = "Azure Hahiqube IP address"
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

variable "gcp_credentials" {
  type        = string
  default     = "~/.gcp/credentials.json"
  description = "GCP project credentials file"
}

variable "gcp_project" {
  type        = string
  default     = "default"
  description = "GCP project ID"
}

variable "gcp_region" {
  type        = string
  description = "The region in which all GCP resources will be launched"
  default     = "australia-southeast1"
}

variable "gcp_account_id" {
  type        = string
  description = "Account ID"
  default     = "sa-consul-compute-prod"
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
  type        = list(string)
  default     = ["hashiqube"]
  description = "Cluster tag to apply"
}

variable "gcp_cluster_size" {
  type        = number
  default     = 1
  description = "size of the cluster"
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
  type        = string
  default     = "n1-standard-1"
  description = "GCP Machine Type"
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
