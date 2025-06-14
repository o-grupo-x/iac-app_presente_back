# Frontend Infrastructure on GKE

This repository provisions a Google Kubernetes Engine (GKE) cluster and deploys the frontend application. A small Prometheus instance runs inside the cluster and exposes metrics so an external Grafana deployment can scrape them.

## Prerequisites
- Docker
- Terraform >= 1.8
- gcloud CLI configured for a Google Cloud project with Kubernetes Engine enabled

### Required GitHub Secrets

- `GCP_CREDENTIALS_B64` – base64 encoded service account key with permissions for GKE and GCR

## Usage

1. Authenticate with gcloud using the service account key.
2. Provision the GKE cluster with Terraform:

   ```bash
   cd terraform
   terraform init
   terraform apply
   ```
   
3. Build and push the Docker image:

   ```bash
   docker build -t gcr.io/<PROJECT_ID>/frontend:latest .
   docker push gcr.io/<PROJECT_ID>/frontend:latest
   ```
4. Configure kubectl using `gcloud container clusters get-credentials` and apply the manifests in `k8s/`:

   ```bash
   gcloud container clusters get-credentials $(terraform output -raw cluster_name) \
     --zone $(terraform output -raw cluster_zone)
   kubectl apply -f k8s/
   ```

The GitHub Actions workflow performs these steps automatically on every push.
