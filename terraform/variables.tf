variable "project_id" {
  description = "GCP project ID"
  type        = string
  default     = "app-chamada-5706"
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "GCP zone"
  type        = string
  default     = "us-central1-a"
}

variable "cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
  default     = "frontend-cluster"
}

variable "node_count" {
  description = "Number of nodes in the primary node pool"
  type        = number
  default     = 2
}
