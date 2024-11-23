/* No space around =
export TF_VAR_project_id="mon-cloud-lab"
export TF_VAR_project_number="583630435909"
export TF_VAR_region="us-central1"
echo $TF_VAR_project_id
echo $TF_VAR_region
*/

# (1) enable apis
module "enable_apis" {
  source     = "../modules/a01_enable_apis"
  project_id = var.project_id
  api_services = var.api_list
}

# (5) secrete manager
module "github_token_secret" {
  source              = "../modules/c05_secret_manager"
  project_id          = var.project_id
  secret_id         = var.secret_id_github
}

module "secret_db_user" {
  source              = "../modules/c05_secret_manager"
  project_id          = var.project_id
  secret_id         = var.secret_id_db_user
}

module "secret_db_password" {
  source              = "../modules/c05_secret_manager"
  project_id          = var.project_id
  secret_id         = var.secret_id_db_password
}


module "github_token_secret_access2" {
  source              = "../modules/c06_secret_access"
  secret_id = var.secret_id_github
  service_account_email = local.cloud_build_service_account_email
}


//=============================================

# github connection
module "github_connection" {
  source = "../modules/c07_cloudbuild_connection"

  project_id               = var.project_id
  region                   = var.region
  github_app_installation_id = var.github_app_installation_id
  connection_name = var.github_connection_name
  secret_id = var.secret_id_github

  depends_on   = [module.github_token_secret_access2]
}

module "cicd_pipeline_infra" {
  source = "../modules/d11_cicd_pipeline_wrapper"

  project_id = var.project_id
  region = var.region
  cicd_sa_name = var.cicd_sa_name_infra
  cicd_sa_role_list = var.cicd_sa_role_list_infra
  wi_pool_id = local.wi_pool_id_infra
  wi_pool_name = local.wi_pool_name_infra
  wi_pool_provider_id = local.wi_pool_provider_id_infra
  github_repository = var.github_repository_infra
  github_secret_id = var.secret_id_github
  parent_connection = module.github_connection.connection_name
  name_gcp_repo = var.repo_name_in_gcp_infra
  remote_uri_repo = var.github_repo_uri_infra 


  depends_on   = [module.github_connection]
}


module "cicd_pipeline_app" {
  source = "../modules/d11_cicd_pipeline_wrapper"

  project_id = var.project_id
  region = var.region
  cicd_sa_name = var.cicd_sa_name_app
  cicd_sa_role_list = var.cicd_sa_role_list_app
  wi_pool_id = local.wi_pool_id_app
  wi_pool_name = local.wi_pool_name_app
  wi_pool_provider_id = local.wi_pool_provider_id_app
  github_repository = var.github_repository_app
  github_secret_id = var.secret_id_github
  parent_connection = module.github_connection.connection_name
  name_gcp_repo = var.repo_name_in_gcp_app
  remote_uri_repo = var.github_repo_uri_app 


  depends_on   = [module.github_connection]
}


# (6) secret db_user/db_password access

module "secret_access_db_user_infra" {
  source              = "../modules/c06_secret_access"
  secret_id = var.secret_id_db_user
  service_account_email = module.cicd_pipeline_infra.service_account_email
}
module "secret_access_db_user_app" {
  source              = "../modules/c06_secret_access"
  secret_id = var.secret_id_db_user
  service_account_email = module.cicd_pipeline_app.service_account_email
}

module "secret_access_db_password_infra" {
  source              = "../modules/c06_secret_access"
  secret_id = var.secret_id_db_password
  service_account_email = module.cicd_pipeline_infra.service_account_email
}
module "secret_access_db_password_app" {
  source              = "../modules/c06_secret_access"
  secret_id = var.secret_id_db_password
  service_account_email = module.cicd_pipeline_app.service_account_email
}
