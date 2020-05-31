output "AWS_hashiqube-service-consul" {
  value = "${aws_eip.hashiqube.public_ip}"
}

output "AWS_hashiqube-ssh-service-consul" {
  value = "ssh ubuntu@${aws_eip.hashiqube.public_ip}"
}

output "AWS_hashiqube-consul-service-consul" {
  value = "http://${aws_eip.hashiqube.public_ip}:8500"
}

output "AWS_hashiqube-nomad-service-consul" {
  value = "http://${aws_eip.hashiqube.public_ip}:4646"
}

output "AWS_hashiqube-vault-service-consul" {
  value = "http://${aws_eip.hashiqube.public_ip}:8200"
}

output "AWS_hashiqube-fabio-ui-service-consul" {
  value = "http://${aws_eip.hashiqube.public_ip}:9998"
}