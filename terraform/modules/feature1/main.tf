data "google_compute_image" "debian" {
  family  = "debian-11"
  project = "debian-cloud"
}

resource "google_compute_instance" "test_instance_1" {
  name         = "test-instance-1"
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
