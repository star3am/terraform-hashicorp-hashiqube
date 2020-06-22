module "aws-hashiqube" {
  # When using these modules in your own templates, you will need to use a Git URL with a ref attribute that pins you
  # to a specific version of the modules, such as the following example:
  # source = "git::git@github.com:star3am/terraform-hashicorp-hashiqube.git//modules/aws-hashiqube?ref=v0.0.1"
  source    = "../../modules/aws-hashiqube/"
  aws_credentials = "~/.aws/credentials.json"
  ssh_public_key  = "~/.ssh/id_rsa.pub"
}
