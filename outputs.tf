output "your_ipaddress" {
  value       = data.external.myipaddress.result.ip
  description = "Your Public IP Address, used for Whitelisting"
}

output "aaa_welcome" {
  value       = <<WELCOME
Your HashiQube instance is busy launching, usually this takes ~5 minutes.
Below are some links to open in your browser, and commands you can copy and paste in a terminal to login via SSH into your HashiQube instance.
Thank you for using this module, you are most welcome to fork this repository to make it your own.
** DO NOT USE THIS IN PRODUCTION **
WELCOME
  description = <<WELCOME
A Welcome message. Your HashiQube instance is busy launching, usually this takes ~5 minutes.
Below are some links to open in your browser, and commands you can copy and paste in a terminal to login via SSH into your HashiQube instance.
Thank you for using this module, you are most welcome to fork this repository to make it your own.
** DO NOT USE THIS IN PRODUCTION **
WELCOME
}

output "aab_instructions" {
  value       = <<INSTRUCTIONS
Use the Hashiqube SSH output below to login to your instance
To get Vault Shamir keys and Root token do "sudo cat /etc/vault/init.file"
INSTRUCTIONS
  description = <<INSTRUCTIONS
Use the Hashiqube SSH output below to login to your instance
To get Vault Shamir keys and Root token do "sudo cat /etc/vault/init.file"
INSTRUCTIONS
}

# AWS
output "aws_hashiqube_ip" {
  value       = var.deploy_to_aws ? try(module.aws_hashiqube[0].hashiqube_ip, null) : null
  description = "Hashiqube on AWS IP address"
}

output "aws_hashiqube_ssh" {
  value       = var.deploy_to_aws ? try("ssh ubuntu@${module.aws_hashiqube[0].hashiqube_ip}", null) : null
  description = "Hashiqube on AWS SSH connection string"
}

output "aws_hashiqube_consul" {
  value       = var.deploy_to_aws ? try("http://${module.aws_hashiqube[0].hashiqube_ip}:8500", null) : null
  description = "Hashiqube on AWS Consul URL"
}

output "aws_hashiqube_nomad" {
  value       = var.deploy_to_aws ? try("http://${module.aws_hashiqube[0].hashiqube_ip}:4646", null) : null
  description = "Hashiqube on AWS Nomad URL"
}

output "aws_hashiqube_vault" {
  value       = var.deploy_to_aws ? try("http://${module.aws_hashiqube[0].hashiqube_ip}:8200", null) : null
  description = "Hashiqube on AWS Vault URL"
}

output "aws_hashiqube_waypoint" {
  value       = var.deploy_to_aws ? try("https://${module.aws_hashiqube[0].hashiqube_ip}:9702", null) : null
  description = "Hashiqube on AWS Waypoint URL"
}

output "aws_hashiqube_boundary" {
  value       = var.deploy_to_aws ? try("http://${module.aws_hashiqube[0].hashiqube_ip}:19200 username: admin password: password", null) : null
  description = "Hashiqube on AWS Boundary URL"
}

output "aws_hashiqube_traefik_ui" {
  value       = var.deploy_to_aws ? try("http://${module.aws_hashiqube[0].hashiqube_ip}:8181", null) : null
  description = "Hashiqube on AWS Traefik UI URL"
}

output "aws_hashiqube_traefik_lb" {
  value       = var.deploy_to_aws ? try("http://${module.aws_hashiqube[0].hashiqube_ip}:8080", null) : null
  description = "Hashiqube on AWS Traefik LB URL"
}

output "aws_hashiqube_fabio_ui" {
  value       = var.deploy_to_aws ? try("http://${module.aws_hashiqube[0].hashiqube_ip}:9998", null) : null
  description = "Hashiqube on AWS Fabio UI URL"
}

output "aws_hashiqube_fabio_lb" {
  value       = var.deploy_to_aws ? try("http://${module.aws_hashiqube[0].hashiqube_ip}:9999", null) : null
  description = "Hashiqube on AWS Fabio LB URL"
}

# Azure
output "azure_hashiqube_ip" {
  value       = var.deploy_to_azure ? try(module.azure_hashiqube[0].hashiqube_ip, null) : null
  description = "Hashiqube on Azure IP address"
}

output "azure_hashiqube_ssh" {
  value       = var.deploy_to_azure ? try("ssh ubuntu@${module.azure_hashiqube[0].hashiqube_ip}", null) : null
  description = "Hashiqube on Azure SSH connection string"
}

output "azure_hashiqube_consul" {
  value       = var.deploy_to_azure ? try("http://${module.azure_hashiqube[0].hashiqube_ip}:8500", null) : null
  description = "Hashiqube on Azure Consul URL"
}

output "azure_hashiqube_nomad" {
  value       = var.deploy_to_azure ? try("http://${module.azure_hashiqube[0].hashiqube_ip}:4646", null) : null
  description = "Hashiqube on Azure Nomad URL"
}

output "azure_hashiqube_vault" {
  value       = var.deploy_to_azure ? try("http://${module.azure_hashiqube[0].hashiqube_ip}:8200", null) : null
  description = "Hashiqube on Azure Vault URL"
}

output "azure_hashiqube_waypoint" {
  value       = var.deploy_to_azure ? try("https://${module.azure_hashiqube[0].hashiqube_ip}:9702", null) : null
  description = "Hashiqube on Azure Waypoint URL"
}

output "azure_hashiqube_boundary" {
  value       = var.deploy_to_azure ? try("http://${module.azure_hashiqube[0].hashiqube_ip}:19200 username: admin password: password", null) : null
  description = "Hashiqube on Azure Boundary URL"
}

output "azure_hashiqube_traefik_ui" {
  value       = var.deploy_to_azure ? try("http://${module.azure_hashiqube[0].hashiqube_ip}:8181", null) : null
  description = "Hashiqube on Azure Traefik UI URL"
}

output "azure_hashiqube_traefik_lb" {
  value       = var.deploy_to_azure ? try("http://${module.azure_hashiqube[0].hashiqube_ip}:8080", null) : null
  description = "Hashiqube on Azure Traefik LB URL"
}

output "azure_hashiqube_fabio_ui" {
  value       = var.deploy_to_azure ? try("http://${module.azure_hashiqube[0].hashiqube_ip}:9998", null) : null
  description = "Hashiqube on Azure Fabio UI URL"
}

output "azure_hashiqube_fabio_lb" {
  value       = var.deploy_to_azure ? try("http://${module.azure_hashiqube[0].hashiqube_ip}:9999", null) : null
  description = "Hashiqube on Azure Fabio LB URL"
}

# GCP
output "gcp_hashiqube_ip" {
  value       = var.deploy_to_gcp ? try(module.gcp_hashiqube[0].hashiqube_ip, null) : null
  description = "Hashiqube on GCP IP address"
}

output "gcp_hashiqube_ssh" {
  value       = var.deploy_to_gcp ? try("ssh ubuntu@${module.gcp_hashiqube[0].hashiqube_ip}", null) : null
  description = "Hashiqube on GCP SSH connection string"
}

output "gcp_hashiqube_consul" {
  value       = var.deploy_to_gcp ? try("http://${module.gcp_hashiqube[0].hashiqube_ip}:8500", null) : null
  description = "Hashiqube on GCP Consul URL"
}

output "gcp_hashiqube_nomad" {
  value       = var.deploy_to_gcp ? try("http://${module.gcp_hashiqube[0].hashiqube_ip}:4646", null) : null
  description = "Hashiqube on GCP Nomad URL"
}

output "gcp_hashiqube_vault" {
  value       = var.deploy_to_gcp ? try("http://${module.gcp_hashiqube[0].hashiqube_ip}:8200", null) : null
  description = "Hashiqube on GCP Vault URL"
}

output "gcp_hashiqube_waypoint" {
  value       = var.deploy_to_gcp ? try("https://${module.gcp_hashiqube[0].hashiqube_ip}:9702", null) : null
  description = "Hashiqube on GCP Waypoint URL"
}

output "gcp_hashiqube_boundary" {
  value       = var.deploy_to_gcp ? try("http://${module.gcp_hashiqube[0].hashiqube_ip}:19200 username: admin password: password", null) : null
  description = "Hashiqube on GCP Boundary URL"
}

output "gcp_hashiqube_traefik_ui" {
  value       = var.deploy_to_gcp ? try("http://${module.gcp_hashiqube[0].hashiqube_ip}:8181", null) : null
  description = "Hashiqube on GCP Traefik UI URL"
}

output "gcp_hashiqube_traefik_lb" {
  value       = var.deploy_to_gcp ? try("http://${module.gcp_hashiqube[0].hashiqube_ip}:8080", null) : null
  description = "Hashiqube on GCP Traefik LB URL"
}

output "gcp_hashiqube_fabio_ui" {
  value       = var.deploy_to_gcp ? try("http://${module.gcp_hashiqube[0].hashiqube_ip}:9998", null) : null
  description = "Hashiqube on GCP Fabio UI URL"
}

output "gcp_hashiqube_fabio_lb" {
  value       = var.deploy_to_gcp ? try("http://${module.gcp_hashiqube[0].hashiqube_ip}:9999", null) : null
  description = "Hashiqube on GCP Fabio LB URL"
}
