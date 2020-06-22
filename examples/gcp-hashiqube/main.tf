module "gcp-hashiqube" {
  # When using these modules in your own templates, you will need to use a Git URL with a ref attribute that pins you
  # to a specific version of the modules, such as the following example:
  # source = "git::git@github.com:star3am/terraform-hashicorp-hashiqube.git//modules/gcp-hashiqube?ref=v0.0.1"
  source          = "../../modules/gcp-hashiqube"
  gcp_project     = "thermal-formula-256223"
  gcp_credentials = "~/.gcp/credentials.json"
  ssh_public_key  = "~/.ssh/id_rsa.pub"
  vault           = { 
                      enabled = true
                      version = "1.4.1" 
                    }
}
