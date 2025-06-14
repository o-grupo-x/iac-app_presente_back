resource "google_container_cluster" "app_chamada_production" {
  name     = var.cluster_name
  location = var.region

  remove_default_node_pool = true
  initial_node_count       = 1

  node_config {
    machine_type    = var.machine_type
    service_account = var.node_service_account
    disk_size_gb    = 30 # or 20
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }

  ip_allocation_policy {}
}

resource "google_container_node_pool" "app_chamada_production_nodes" {
  name       = "primary-node-pool"
  location   = google_container_cluster.app_chamada_production.location
  cluster    = google_container_cluster.app_chamada_production.name

  node_config {
    machine_type    = var.machine_type
    service_account = var.node_service_account
    disk_size_gb    = 30
    oauth_scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  initial_node_count = 2
}
