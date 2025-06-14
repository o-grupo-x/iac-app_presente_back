resource "google_container_cluster" "app_chamada_production" {
  name     = var.cluster_name
  location = var.region

  remove_default_node_pool = true
  initial_node_count       = 1

  release_channel {
    channel = "REGULAR"
  }

  networking_mode = "VPC_NATIVE"
}

resource "google_container_node_pool" "app_chamada_production_nodes" {
  name       = "primary-node-pool"
  location   = google_container_cluster.app_chamada_production.location
  cluster    = google_container_cluster.app_chamada_production.name

  node_config {
    machine_type    = var.machine_type
    service_account = var.node_service_account
    disk_size_gb    = 10
    disk_type       = "pd-standard"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }

  initial_node_count = 2

  autoscaling {
    min_node_count = 1
    max_node_count = 5
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }
}
