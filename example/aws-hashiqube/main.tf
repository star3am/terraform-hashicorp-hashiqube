module "aws-hashiqube" {
  source    = "../../modules/aws-hashiqube/"
  aws_credentials = "~/.aws/credentials.json"
  ssh_public_key  = "~/.ssh/id_rsa.pub"
}
