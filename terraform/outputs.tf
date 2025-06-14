output "cluster_name" {
  value = google_container_cluster.app_chamada_production.name
}
output "cluster_zone" {
  value = google_container_cluster.app_chamada_production.location
}
output "endpoint" {
  value = google_container_cluster.app_chamada_production.endpoint
}
output "kubernetes_cluster_name" {
  value = google_container_cluster.app_chamada_production.name
}

output "prometheus_service_ip" {
  value = kubernetes_service.prometheus.status[0].load_balancer[0].ingress[0].ip
}
