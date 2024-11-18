data "google_compute_image" "debian" {
  family  = "debian-11"
  project = "debian-cloud"
}

resource "random_pet" "instance_name" {
  length = 2
  separator = "-"
}

resource "google_compute_instance" "test_instance_1" {
  name         = "test-instance-${random_pet.instance_name.id}"
  machine_type = "f1-micro"
  zone         = "europe-west4-a"

  boot_disk {
    initialize_params {
      image = data.google_compute_image.debian.self_link
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}

output "example_output_variable" {
  value = jsonencode({
    instance_name  = google_compute_instance.test_instance_1.name
    instance_ip    = google_compute_instance.test_instance_1.network_interface[0].access_config[0].nat_ip
    instance_zone  = google_compute_instance.test_instance_1.zone
  })
}