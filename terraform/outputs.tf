output "cluster_name" {
  value = google_container_cluster.frontend.name
}

output "endpoint" {
  value = google_container_cluster.frontend.endpoint
}
