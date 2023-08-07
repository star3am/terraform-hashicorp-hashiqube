output "hashiqube_ip" {
  value       = aws_eip.hashiqube.public_ip
  description = "Hashiqube on AWS IP address"
}
