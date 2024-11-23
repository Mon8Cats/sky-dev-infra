# GCP Overview


## Enable an API

It means granting my project access to use that APIs features and resources

1. API access is configured for my project.
2. IAM permissions and roles are recognized.
3. Billing is linked (if required).
4. Google Cloud service infrastructure is deployed.
5. API-specific quotas are set.
6. Monitoring and logs are set up.
7. Configuration and authentication changes.

For certain APIs, default service account are automatically created.

1. Compute Engine API
2. Kubernetes Engine API
3. App Engine Admin API
4. Cloud Build API
5. Cloud Functions API
6. Cloud Run API
7. Dataproc API
8. Cloud SQL Admin API
9. Cloud Storage Transfer Service API

List all service accounts in my project

```bash
gcloud iam service-accounts list --project=PROJECT_ID
```

Replace the default service account with a custom service account

```bash
gcloud iam service-accounts list --project=PROJECT_ID

gcloud iam service-accounts create CUSTOM_SERVICE_ACCOUNT_NAME \
    --description="Custom service account for Compute Engine" \
    --display-name="Custom Compute Engine SA" \
    --project=PROJECT_ID

gcloud projects add-iam-policy-binding PROJECT_ID \
    --member="serviceAccount:CUSTOM_SERVICE_ACCOUNT_NAME@PROJECT_ID.iam.gserviceaccount.com" \
    --role="roles/compute.admin"

gcloud builds triggers update TRIGGER_NAME \
    --service-account=CUSTOM_SERVICE_ACCOUNT_NAME@PROJECT_ID.iam.gserviceaccount.com \
    --project=PROJECT_ID

gcloud iam service-accounts disable DEFAULT_SERVICE_ACCOUNT_EMAIL \
    --project=PROJECT_ID

gcloud iam service-accounts list --project=PROJECT_ID

gcloud iam service-accounts delete DEFAULT_SERVICE_ACCOUNT_EMAIL \
    --project=PROJECT_ID
```

## Active project in Google Cloud Shell

```bash
gcloud projects list
gcloud config get-value project #
gcloud config configurations describe CONFIG_NAME
gcloud config configurations activate CONFIG_NAME
gcloud config set project PROJECT_ID


PROJECT_ID="sky-root"
PROJECT_NUMBER=262659146932
REGION="us-central1"

```


## Cloud Storage Bucket

```bash
gcloud services list --enabled # enabled api list
gcloud storage buckets list # bucket list
gcloud storage buckets list --project=PROJECT_ID
gcloud storage buckets list --filter="LOCATION:US"
gcloud storage buckets list --format="table(name, location, storageClass)"
gcloud storage buckets list --format="json"
gcloud storage buckets list --format="csv(name, location, storageClass)"
gcloud storage buckets list --filter="name:BUCKET_NAME"

```


## Globally Unique Names and IDs (use lower case and hyphens 4-32 characters)

- Project ID
- Workload Identity Pool ID
- Workload Identity Provider ID
- Cloud Storage Bucket for storing logs or artifacts
- Artifact Registry Repository
- Cloud Build Trigger Name
- Cloud Run Service Name
- Cloud SQL Instance Name


## Secret Manager

```bash
gcloud secrets list
gcloud secrets list --format=json
gcloud secrets describe YOUR_SECRET_NAME
gcloud secrets versions list db_password
gcloud secrets versions access latest --secret=github_token


```