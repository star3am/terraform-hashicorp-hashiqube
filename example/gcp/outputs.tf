output "hashiqube-01-ip" {
  value = "${module.gcp.hashiqube_ip}"
}

output "hashiqube-02-ssh" {
  value = "ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -q ubuntu@${module.gcp.hashiqube_ip}"
}

output "hashiqube-03-consul" {
  value = "http://${module.gcp.hashiqube_ip}:8500"
}

output "hashiqube-04-nomad" {
  value = "http://${module.gcp.hashiqube_ip}:4646"
}

output "hashiqube-05-vault" {
  value = <<VAULT
Run the folowing command to get the Initial Root Token for Vault
ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -q ubuntu@${module.gcp.hashiqube_ip} "grep 'Initial Root Token' /etc/vault/init.file | cut -d ':' -f2 | tr -d ' '"
Copy the Initial Root Token for Vault and use it to login at the Vault address below
http://${module.gcp.hashiqube_ip}:8200
  VAULT
}

output "hashiqube-06-fabio" {
  value = "http://${module.gcp.hashiqube_ip}:9998"
}