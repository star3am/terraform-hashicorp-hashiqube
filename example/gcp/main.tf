# debug output
resource "null_resource" "variables" {
  triggers = {
    location  = var.location
    whitelist = var.whitelist
    gcp_project = "thermal-formula-256223"
  }
}

module "gcp" {
  source    = "../../modules/gcp"
  location  = "gcp"
  whitelist = ""
  gcp_project = "thermal-formula-256223"
}
