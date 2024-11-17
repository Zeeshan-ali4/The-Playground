provider "google" {
  project = var.project_id
  region  = "europe-west4"
}

# VM 1
resource "google_compute_instance" "test_instance_1" {
  name         = "test-instance-1"
  machine_type = "f1-micro"
  zone         = "europe-west4-a"

  boot_disk {
    initialize_params {
      image_family = "debian-11"
      image_project = "debian-cloud"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}

# VM 2
resource "google_compute_instance" "test_instance_2" {
  name         = "test-instance-2"
  machine_type = "e2-micro"
  zone         = "europe-west4-b"

  boot_disk {
    initialize_params {
      image_family = "debian-11"
      image_project = "debian-cloud"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}
