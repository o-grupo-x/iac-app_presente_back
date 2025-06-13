# Frontend Infrastructure on GKE

This repository provisions a Google Kubernetes Engine (GKE) cluster and deploys the frontend application. A small Prometheus instance runs inside the cluster and exposes metrics so an external Grafana deployment can scrape them.

## Prerequisites

- Terraform 1.8+
- Docker
- Access to a Google Cloud project with Kubernetes Engine enabled

### Required GitHub Secrets

- `GCP_CREDENTIALS_B64` – base64 encoded service account key with permissions for GKE and GCR
- `GKE_CLUSTER_NAME` – name of the GKE cluster
- `GKE_CLUSTER_ZONE` – cluster zone (e.g. `us-central1-a`)

## Usage

1. Place the decoded service account key at `terraform/credentials.json` when running locally.
2. Run `terraform init` and `terraform apply` inside the `terraform` directory to create the cluster.
3. Build and push the Docker image:

   ```bash
   docker build -t gcr.io/<PROJECT_ID>/frontend:latest .
   docker push gcr.io/<PROJECT_ID>/frontend:latest
   ```
4. Configure kubectl using `gcloud container clusters get-credentials` and apply the manifests in `k8s/`:

   ```bash
   kubectl apply -f k8s/
   ```

The GitHub Actions workflow performs the same steps automatically on every push.
