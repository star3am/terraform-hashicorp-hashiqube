# https://registry.terraform.io/modules/star3am/hashiqube/hashicorp

# terraform init
# terraform plan
# terraform apply

module "hashiqube" {
  source          = "star3am/hashiqube/hashicorp"
  deploy_to_aws   = true
  deploy_to_gcp   = false
  deploy_to_azure = false
  debug_user_data = true
}
