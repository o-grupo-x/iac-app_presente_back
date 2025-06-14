output "cluster_name" {
  value = google_container_cluster.frontend.name
}
output "cluster_zone" {
  value = google_container_cluster.frontend.location
}
output "endpoint" {
  value = google_container_cluster.frontend.endpoint
}
