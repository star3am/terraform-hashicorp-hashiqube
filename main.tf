# A Terraform module to bring up Hashiqube in the Cloud.
# https://hashiqube.com
# DO NOT USE THIS IN PRODUCTION
# Counter to force push PR -> Merge without any real changes
# Welcome to my Terraform Cloud demo everyone
# I hope you have a great time today!

terraform {
  required_version = "~> 1.0"

  required_providers {
    # https://registry.terraform.io/providers/hashicorp/aws/latest
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.67"
    }
    # https://registry.terraform.io/providers/hashicorp/azurerm/latest
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.57"
    }
    # https://registry.terraform.io/providers/hashicorp/google/latest
    google = {
      source  = "hashicorp/google"
      version = "~> 4.66"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "~> 3.4"
    }
  }
}

provider "aws" {
  region = var.aws_region
  # Default authentication is via ENV variables see: https://registry.terraform.io/providers/hashicorp/aws/latest/docs#environment-variables
  # shared_credentials_files = [file(var.aws_credentials)]
  # profile                  = var.aws_profile
}

provider "azurerm" {
  # Default authentication is via ENV variables see: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret#creating-a-service-principal
  features {}
}

provider "google" {
  # Default authentication is via ENV variables see: https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference.html#authentication-configuration
  # credentials = file(var.gcp_credentials)
  project = var.gcp_project
  region  = var.gcp_region
}

# https://developer.hashicorp.com/terraform/cloud-docs/api-docs/ip-ranges
# curl -X GET https://app.terraform.io/api/meta/ip-ranges
data "http" "terraform_cloud_ip_ranges" {
  url = "https://app.terraform.io/api/meta/ip-ranges"

  request_headers = {
    # Enabling the `If-Modified-Since` flag may result in an empty response
    # If-Modified-Since = "Tue, 26 May 2020 15:10:05 GMT"
    Accept = "application/json"
  }
}

locals {
  terraform_cloud_ip_ranges = jsondecode(data.http.terraform_cloud_ip_ranges.response_body)
}

resource "null_resource" "hashiqube" {
  triggers = {
    deploy_to_azure      = var.deploy_to_azure
    deploy_to_gcp        = var.deploy_to_gcp
    deploy_to_aws        = var.deploy_to_aws
    debug_user_data      = var.debug_user_data
    vagrant_provisioners = var.vagrant_provisioners
  }
}

module "gcp_hashiqube" {
  count = var.deploy_to_gcp ? 1 : 0
  # When using these modules in your own templates, you will need to use a Git URL with a ref attribute that pins you
  # to a specific version of the modules, such as the following example:
  # source = "git::git@github.com:star3am/terraform-hashicorp-hashiqube.git//modules/gcp-hashiqube?ref=v0.0.1"
  source                                  = "./modules/gcp-hashiqube"
  deploy_to_aws                           = var.deploy_to_aws
  deploy_to_azure                         = var.deploy_to_azure
  deploy_to_gcp                           = var.deploy_to_gcp
  whitelist_cidr                          = var.whitelist_cidr
  gcp_project                             = var.gcp_project
  gcp_credentials                         = var.gcp_credentials
  gcp_cluster_description                 = var.gcp_cluster_description
  gcp_cluster_name                        = var.gcp_cluster_name
  gcp_cluster_size                        = var.gcp_cluster_size
  gcp_machine_type                        = var.gcp_machine_type
  gcp_region                              = var.gcp_region
  gcp_account_id                          = var.gcp_account_id
  gcp_root_volume_disk_size_gb            = var.gcp_root_volume_disk_size_gb
  gcp_root_volume_disk_type               = var.gcp_root_volume_disk_type
  gcp_zones                               = var.gcp_zones
  gcp_cluster_tag_name                    = var.gcp_cluster_tag_name
  ssh_public_key                          = var.ssh_public_key
  ssh_private_key                         = var.ssh_private_key
  debug_user_data                         = var.debug_user_data
  debug_allow_ssh_cidr_range              = var.debug_allow_ssh_cidr_range
  aws_hashiqube_ip                        = var.deploy_to_aws ? try(module.aws_hashiqube[0].hashiqube_ip, null) : null
  azure_hashiqube_ip                      = var.deploy_to_azure ? try(module.azure_hashiqube[0].hashiqube_ip, null) : null
  vagrant_provisioners                    = var.vagrant_provisioners
  terraform_cloud_api_ip_ranges           = local.terraform_cloud_ip_ranges.api
  terraform_cloud_notifications_ip_ranges = local.terraform_cloud_ip_ranges.notifications
}

module "aws_hashiqube" {
  count = var.deploy_to_aws ? 1 : 0
  # When using these modules in your own templates, you will need to use a Git URL with a ref attribute that pins you
  # to a specific version of the modules, such as the following example:
  # source = "git::git@github.com:star3am/terraform-hashicorp-hashiqube.git//modules/aws-hashiqube?ref=v0.0.1"
  source                     = "./modules/aws-hashiqube"
  deploy_to_aws              = var.deploy_to_aws
  deploy_to_azure            = var.deploy_to_azure
  deploy_to_gcp              = var.deploy_to_gcp
  ssh_public_key             = var.ssh_public_key
  ssh_private_key            = var.ssh_private_key
  debug_user_data            = var.debug_user_data
  debug_allow_ssh_cidr_range = var.debug_allow_ssh_cidr_range
  aws_region                 = var.aws_region
  aws_instance_type          = var.aws_instance_type
  # aws_profile          = var.aws_profile
  # aws_credentials      = var.aws_credentials
  whitelist_cidr                          = var.whitelist_cidr
  azure_hashiqube_ip                      = var.deploy_to_azure ? try(module.azure_hashiqube[0].hashiqube_ip, null) : null
  gcp_hashiqube_ip                        = var.deploy_to_gcp ? try(module.gcp_hashiqube[0].hashiqube_ip, null) : null
  vagrant_provisioners                    = var.vagrant_provisioners
  terraform_cloud_api_ip_ranges           = local.terraform_cloud_ip_ranges.api
  terraform_cloud_notifications_ip_ranges = local.terraform_cloud_ip_ranges.notifications
}

module "azure_hashiqube" {
  count = var.deploy_to_azure ? 1 : 0
  # When using these modules in your own templates, you will need to use a Git URL with a ref attribute that pins you
  # to a specific version of the modules, such as the following example:
  # source = "git::git@github.com:star3am/terraform-hashicorp-hashiqube.git//modules/azure-hashiqube?ref=v0.0.1"
  source                                  = "./modules/azure-hashiqube"
  deploy_to_aws                           = var.deploy_to_aws
  deploy_to_azure                         = var.deploy_to_azure
  deploy_to_gcp                           = var.deploy_to_gcp
  whitelist_cidr                          = var.whitelist_cidr
  ssh_public_key                          = var.ssh_public_key
  ssh_private_key                         = var.ssh_private_key
  debug_user_data                         = var.debug_user_data
  debug_allow_ssh_cidr_range              = var.debug_allow_ssh_cidr_range
  aws_hashiqube_ip                        = var.deploy_to_aws ? try(module.aws_hashiqube[0].hashiqube_ip, null) : null
  gcp_hashiqube_ip                        = var.deploy_to_gcp ? try(module.gcp_hashiqube[0].hashiqube_ip, null) : null
  azure_region                            = var.azure_region
  azure_instance_type                     = var.azure_instance_type
  vagrant_provisioners                    = var.vagrant_provisioners
  terraform_cloud_api_ip_ranges           = local.terraform_cloud_ip_ranges.api
  terraform_cloud_notifications_ip_ranges = local.terraform_cloud_ip_ranges.notifications
}
