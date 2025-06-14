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
}

variable "node_count" {
  description = "Number of nodes in the primary node pool"
  type        = number
  default     = 2
}

variable "machine_type" {
  description = "Type of VM for Kubernetes nodes"
  type        = string
  default     = "e2-medium"
}

variable "node_service_account" {
  description = "Service Account for Kubernetes nodes"
  type        = string
  default     = "gke-node@app-chamada-5706.iam.gserviceaccount.com"
}


variable "namespace_name" {
  description = "Namespace for the app"
  default     = "app-chamada-production"
}


variable "delete_old_clusters" {
  description = "Whether to delete old clusters (true/false)"
  type        = bool
  default     = false
}