# Infrastructure on GKE

This repository provisions a Google Kubernetes Engine (GKE) cluster and deploys a Prometheus instance for metrics collection. No application images are built or deployed by default.

## Prerequisites
- Terraform >= 1.8
- gcloud CLI configured for a Google Cloud project with Kubernetes Engine enabled

### Required GitHub Secrets

- `GCP_CREDENTIALS_B64` – base64 encoded service account key with permissions for GKE

## Usage

1. Authenticate with gcloud using the service account key.
2. Provision the GKE cluster with Terraform:

   ```bash
   cd terraform
   terraform init
   terraform apply
   ```
   
3. Configure kubectl using `gcloud container clusters get-credentials` and apply the Prometheus manifest:

   ```bash
   gcloud container clusters get-credentials $(terraform output -raw cluster_name) \
     --zone $(terraform output -raw cluster_zone)
   kubectl apply -f k8s/prometheus.yaml
   ```

The GitHub Actions workflow performs these steps automatically on every push.
