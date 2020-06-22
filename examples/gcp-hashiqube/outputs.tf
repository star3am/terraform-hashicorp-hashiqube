output "hashiqube-01-welcome" {
  value = <<WELCOME
Your HashiQube instance is busy launching, usually this takes ~5 minutes. 
Below are some links to open in your browser, and commands you can copy and paste in a terminal to login via SSH into your HashiQube instance.
Thank you for using this module, you are most welcome to fork this repository to make it your own.
** DO NOT USE THIS IN PRODUCTION **
  WELCOME
}

output "hashiqube-02-ip" {
  value = "${module.gcp-hashiqube.hashiqube_ip}"
}

output "hashiqube-03-ssh" {
  value = "ssh ubuntu@${module.gcp-hashiqube.hashiqube_ip}"
}

output "hashiqube-04-consul" {
  value = "http://${module.gcp-hashiqube.hashiqube_ip}:8500"
}

output "hashiqube-05-nomad" {
  value = "http://${module.gcp-hashiqube.hashiqube_ip}:4646"
}

output "hashiqube-06-vault" {
  value = <<VAULT
Once you can open http://${module.gcp-hashiqube.hashiqube_ip}:8200 in your browser and you see the Vault website, run the folowing command to get the Initial Root Token for Vault
ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -q ubuntu@${module.gcp-hashiqube.hashiqube_ip} "grep 'Root Token' /etc/vault/init.file | cut -d ':' -f2 | tr -d ' '"
Copy the Initial Root Token for Vault and use it to login at the Vault address http://${module.gcp-hashiqube.hashiqube_ip}:8200
  VAULT
}

output "hashiqube-07-fabio" {
  value = "http://${module.gcp-hashiqube.hashiqube_ip}:9998"
}