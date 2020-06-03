module "gcp" {
  source          = "../../modules/gcp"
  gcp_project     = "thermal-formula-256223"
  gcp_credentials = "~/.gcp/credentials.json"
}
