provider "google" {
  #credentials = file(var.gcp_credentials)
  credentials = file("~/.gcp/credentials.json")
  project     = var.gcp_project
  region      = var.gcp_region
}

provider "azurerm" {
  #version = "=2.0.0"
  features {}
}

provider "aws" {
  #region                  = var.aws_region
  #shared_credentials_file = file(var.aws_credentials)
  #profile                 = var.aws_profile
  region                  = "ap-southeast-2"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "default"
}

data "external" "myipaddress" {
  program = ["bash", "-c", "curl -s 'https://api.ipify.org?format=json'"]
}

resource "null_resource" "hashiqube" {
  triggers = {
    deploy_to_azure = var.deploy_to_azure
    deploy_to_gcp   = var.deploy_to_gcp
    deploy_to_aws   = var.deploy_to_aws
    my_ipaddress    = data.external.myipaddress.result.ip
  }
}

module "gcp-hashiqube" {
  count = var.deploy_to_gcp ? 1 : 0
  # When using these modules in your own templates, you will need to use a Git URL with a ref attribute that pins you
  # to a specific version of the modules, such as the following example:
  # source = "git::git@github.com:star3am/terraform-hashicorp-hashiqube.git//modules/gcp-hashiqube?ref=v0.0.1"
  source             = "./modules/gcp-hashiqube"
  deploy_to_aws      = var.deploy_to_aws
  deploy_to_azure    = var.deploy_to_azure
  deploy_to_gcp      = var.deploy_to_gcp
  whitelist_cidr     = var.whitelist_cidr
  gcp_project        = "thermal-formula-256223"
  gcp_credentials    = "~/.gcp/credentials.json"
  ssh_public_key     = "~/.ssh/id_rsa.pub"
  aws_hashiqube_ip   = var.deploy_to_aws ? try(module.aws-hashiqube[0].hashiqube_ip, null) : null
  azure_hashiqube_ip = var.deploy_to_azure ? try(module.azure-hashiqube[0].hashiqube_ip, null) : null
  my_ipaddress       = data.external.myipaddress.result.ip
  vault              = {
    enabled = true
    version = "1.4.1"
  }
}

module "aws-hashiqube" {
  count = var.deploy_to_aws ? 1 : 0
  # When using these modules in your own templates, you will need to use a Git URL with a ref attribute that pins you
  # to a specific version of the modules, such as the following example:
  # source = "git::git@github.com:star3am/terraform-hashicorp-hashiqube.git//modules/aws-hashiqube?ref=v0.0.1"
  source             = "./modules/aws-hashiqube"
  deploy_to_aws      = var.deploy_to_aws
  deploy_to_azure    = var.deploy_to_azure
  deploy_to_gcp      = var.deploy_to_gcp
  whitelist_cidr     = var.whitelist_cidr
  ssh_public_key     = "~/.ssh/id_rsa.pub"
  azure_hashiqube_ip = var.deploy_to_azure ? try(module.azure-hashiqube[0].hashiqube_ip, null) : null
  gcp_hashiqube_ip   = var.deploy_to_gcp ? try(module.gcp-hashiqube[0].hashiqube_ip, null) : null
  my_ipaddress       = data.external.myipaddress.result.ip
  vault              = {
    enabled = true
    version = "1.4.1"
  }
}

module "azure-hashiqube" {
  count = var.deploy_to_azure ? 1 : 0
  # When using these modules in your own templates, you will need to use a Git URL with a ref attribute that pins you
  # to a specific version of the modules, such as the following example:
  # source = "git::git@github.com:star3am/terraform-hashicorp-hashiqube.git//modules/azure-hashiqube?ref=v0.0.1"
  source             = "./modules/azure-hashiqube"
  deploy_to_aws      = var.deploy_to_aws
  deploy_to_azure    = var.deploy_to_azure
  deploy_to_gcp      = var.deploy_to_gcp
  whitelist_cidr     = var.whitelist_cidr
  ssh_public_key     = "~/.ssh/id_rsa.pub"
  aws_hashiqube_ip   = var.deploy_to_aws ? try(module.aws-hashiqube[0].hashiqube_ip, null) : null
  gcp_hashiqube_ip   = var.deploy_to_gcp ? try(module.gcp-hashiqube[0].hashiqube_ip, null) : null
  my_ipaddress       = data.external.myipaddress.result.ip
  vault              = {
    enabled = true
    version = "1.4.1"
  }
}