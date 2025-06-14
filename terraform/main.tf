resource "google_container_cluster" "frontend" {
  name     = var.cluster_name
  location = var.region

  remove_default_node_pool = true
  initial_node_count       = 1

  node_config {
    machine_type    = var.machine_type
    service_account = var.node_service_account  # <---- Aqui você define uma service account customizada
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
