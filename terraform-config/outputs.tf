# Output for external IPs of all instances
output "instance_external_ips" {
  value = {
    for k, v in google_compute_instance.test_instance : k => v.network_interface[0].access_config[0].nat_ip
  }
  description = "External IP addresses of all instances"
}

# Output for internal IPs of all instances
output "instance_internal_ips" {
  value = {
    for k, v in google_compute_instance.test_instance : k => v.network_interface[0].network_ip
  }
  description = "Internal IP addresses of all instances"
}

# Output the instance names for verification
output "instance_names" {
  value = [for k, v in google_compute_instance.test_instance : v.name]
  description = "Names of all created instances"
}
