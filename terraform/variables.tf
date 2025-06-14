variable "machine_type" {
  description = "Type of VM for Kubernetes nodes"
  type        = string
  default     = "e2-medium"
}

variable "node_service_account" {
  description = "Service Account for Kubernetes nodes"
  type        = string
  default     = "your-node-sa@app-chamada-5706.iam.gserviceaccount.com"
}
