# Infrastructure for Cloud Run with Cloud SQL

## 1. Enable APIs

```bash
gcloud services enable \
    compute.googleapis.com \
    container.googleapis.com \
    artifactregistry.googleapis.com

gcloud services enable \
    compute.googleapis.com \ 
    --project=PROJECT_ID

gcloud services list --enabled
gcloud services list --available

gcloud services enable \
    iam.googleapis.com \
    compute.googleapis.com \
    container.googleapis.com \
    cloudbuild.googleapis.com \
    artifactregistry.googleapis.com \
    storage.googleapis.com \
    iamcredentials.googleapis.com
```