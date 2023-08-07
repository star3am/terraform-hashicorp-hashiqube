output "hashiqube_ip" {
  value       = google_compute_address.hashiqube.address
  description = "Hashiqube on GCP IP address"
}
