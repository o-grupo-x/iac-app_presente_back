output "cluster_name" {
  value = google_container_cluster.frontend.name
}
output "cluster_zone" {
  value = google_container_cluster.frontend.location
}
output "endpoint" {
  value = google_container_cluster.frontend.endpoint
}
output "kubernetes_cluster_name" {
  value = google_container_cluster.frontend.name
}

output "prometheus_service_ip" {
  value = kubernetes_service.prometheus.status[0].load_balancer[0].ingress[0].ip
}
