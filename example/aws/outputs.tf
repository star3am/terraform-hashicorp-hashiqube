output "hashiqube-01-ip" {
  value = "${module.aws.hashiqube_ip}"
}

output "hashiqube-02-ssh" {
  value = "ssh ubuntu@${module.aws.hashiqube_ip}"
}

output "hashiqube-03-consul" {
  value = "http://${module.aws.hashiqube_ip}:8500"
}

output "hashiqube-04-nomad" {
  value = "http://${module.aws.hashiqube_ip}:4646"
}

output "hashiqube-05-vault" {
  value = "http://${module.aws.hashiqube_ip}:8200"
}

output "hashiqube-06-fabio" {
  value = "http://${module.aws.hashiqube_ip}:9998"
}