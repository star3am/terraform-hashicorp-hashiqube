output "hashiqube_ip" {
  value       = azurerm_public_ip.hashiqube.ip_address
  description = "Hashiqube on Azure IP address"
}
