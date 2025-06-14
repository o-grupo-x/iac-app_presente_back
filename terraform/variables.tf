variable "project_id" {
  description = "GCP Project ID"
  type        = string
  default     = "app-chamada-5706"
}

variable "region" {
  description = "GCP region to deploy resources"
  type        = string
  default     = "us-east1"
}

variable "cluster_name" {
  description = "Name of the GKE cluster (dynamically passed from GitHub Actions)"
  type        = string
}

variable "node_count" {
  description = "Initial number of nodes in the primary node pool"
  type        = number
  default     = 2
}

variable "machine_type" {
  description = "Type of VM instances for Kubernetes nodes"
  type        = string
  default     = "e2-medium"
}

variable "disk_size_gb" {
  description = "Disk size (in GB) for each node"
  type        = number
  default     = 10
}

variable "disk_type" {
  description = "Disk type for each node (options: pd-standard, pd-ssd)"
  type        = string
  default     = "pd-standard"
}

variable "zones" {
  description = "List of zones to distribute node pool across"
  type        = list(string)
  default     = ["us-east1-b", "us-east1-c", "us-east1-d"]
}

variable "namespace_name" {
  description = "Namespace for the application deployment"
  type        = string
  default     = "app-chamada-production"
}

variable "node_service_account" {
  description = "Service Account email for GKE nodes"
  type        = string
  default     = "gke-node@app-chamada-5706.iam.gserviceaccount.com"
}

variable "delete_old_clusters" {
  description = "Whether to delete old clusters (set true to enable cleanup in GitHub Actions)"
  type        = bool
  default     = false
}
