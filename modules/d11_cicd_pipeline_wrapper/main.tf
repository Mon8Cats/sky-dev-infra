
# (3) create a service account for cicd
module "cicd_service_account" {
  source               = "../b03_service_account"
  project_id           = var.project_id
  service_account_name = var.cicd_sa_name
  display_name         = "cicd Service Account"
  description          = "This service account is used for CI/CD operations"

  roles = var.cicd_sa_role_list

}


# (4) create workload identity pool
module "workload_identity" {
  source           = "../b04_workload_identity"

  project_id = var.project_id
  wi_pool_id = var.wi_pool_id
  wi_pool_name = var.wi_pool_name
  wi_pool_provider_id = var.wi_pool_provider_id
  github_repository = var.github_repository
  service_account_id = "projects/${var.project_id}/serviceAccounts/${var.cicd_sa_name}@${var.project_id}.iam.gserviceaccount.com"

  depends_on   = [module.cicd_service_account]
}

# (5) secret manager - common
# create token, save token - manual

# (6) secret token access
module "github_token_secret_access" {
  source              = "../c06_secret_access"
  secret_id = var.github_secret_id
  service_account_email = module.cicd_service_account.service_account_email
}


# (7) github connection - common


# (8) repository link
module "github_repository_link" {
  source = "../c09_cloudbuild_repository_link"

  region  = var.region
  connection_parent  = var.connection_parent
  repo_name_gcp = var.repo_name_gcp
  repo_uri_remote = var.repo_uri_remote

}

# (9) cloud build trigger - manual
