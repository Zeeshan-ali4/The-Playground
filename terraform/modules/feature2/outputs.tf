output "instance_external_ips" {
  value = [
    google_compute_instance.test_instance_2.network_interface[0].access_config[0].nat_ip
  ]
  description = "External IP addresses of all instances"
}

output "instance_internal_ips" {
  value = [
    google_compute_instance.test_instance_2.network_interface[0].network_ip
  ]
  description = "Internal IP addresses of all instances"
}

output "instance_names" {
  value = [
    google_compute_instance.test_instance_2.name
  ]
  description = "Names of all created instances"
}
