data "google_compute_image" "debian" {
  family  = "debian-11"
  project = "debian-cloud"
}

resource "google_compute_instance" "test_instance_2" {
  name         = "test-instance-2"
  machine_type = "e2-micro"
  zone         = "europe-west4-b"

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
  value = google_compute_instance.test_instance_2.name
}