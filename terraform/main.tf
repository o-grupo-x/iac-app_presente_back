provider "google" {
  project     = var.project_id
  region      = var.region
  zone        = var.zone
  credentials = file("${path.module}/credentials.json")
}

resource "google_container_cluster" "frontend" {
  name     = var.cluster_name
  location = var.zone

  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "primary" {
  name       = "primary"
  location   = var.zone
  cluster    = google_container_cluster.frontend.name
  node_count = var.node_count

  node_config {
    machine_type = "e2-medium"
  }
}
