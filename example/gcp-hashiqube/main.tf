module "gcp-hashiqube" {
  source          = "../../modules/gcp-hashiqube"
  gcp_project     = "thermal-formula-256223"
  gcp_credentials = "~/.gcp/credentials.json"
  ssh_public_key  = "~/.ssh/id_rsa.pub"
}
