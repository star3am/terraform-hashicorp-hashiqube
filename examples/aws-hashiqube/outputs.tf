output "hashiqube-01-welcome" {
  value = <<WELCOME
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

output "hashiqube-02-ip" {
  value = "${module.aws-hashiqube.hashiqube_ip}"
  description = "The IP Address of the Hashiqube instance"
}

output "hashiqube-03-ssh" {
  value = "ssh ubuntu@${module.aws-hashiqube.hashiqube_ip}"
  description = "ssh ubuntu@HASHIQUBE_IP"
}

output "hashiqube-04-consul" {
  value = "http://${module.aws-hashiqube.hashiqube_ip}:8500"
  description = "The URL to access Consul"
}

output "hashiqube-05-nomad" {
  value = "http://${module.aws-hashiqube.hashiqube_ip}:4646"
  description = "The URL to access Nomad"
}

output "hashiqube-06-vault" {
  value = <<VAULT
Once you can open http://${module.aws-hashiqube.hashiqube_ip}:8200 in your browser and you see the Vault website, run the folowing command to get the Initial Root Token for Vault
ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -q ubuntu@${module.aws-hashiqube.hashiqube_ip} "grep 'Root Token' /etc/vault/init.file | cut -d ':' -f2 | tr -d ' '"
Copy the Initial Root Token for Vault and use it to login at the Vault address http://${module.aws-hashiqube.hashiqube_ip}:8200
  VAULT
  description = "An SSH command that will output your Initial Root Token for Vault, used to Login with"
}

output "hashiqube-07-fabio" {
  value = "http://${module.aws-hashiqube.hashiqube_ip}:9998"
  description = "The URL to access Fabio Load Balancer"
}