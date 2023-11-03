# https://registry.terraform.io/modules/star3am/hashiqube/hashicorp

# terraform init
# terraform plan
# terraform apply

module "hashiqube" {
  source  = "star3am/hashiqube/hashicorp"
  version = "1.0.19"
  deploy_to_aws   = true
  deploy_to_gcp   = false
  deploy_to_azure = false
  vagrant_provisioners = "basetools,docker,consul,vault,nomad,boundary,waypoint"
}
