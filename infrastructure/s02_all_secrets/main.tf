/* No space around =
export TF_VAR_project_id="sky-root"
export TF_VAR_project_number="262659146932"
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
  source              = "../../modules/c05_secret_manager"
  project_id          = var.project_id
  secret_id         = var.secret_id_github
}

module "secret_db_user" {
  source              = "../../modules/c05_secret_manager"
  project_id          = var.project_id
  secret_id         = var.secret_id_db_user
}

module "secret_db_password" {
  source              = "../../modules/c05_secret_manager"
  project_id          = var.project_id
  secret_id         = var.secret_id_db_password
}


module "github_token_secret_access_cloud_build_sa" {
  source              = "../../modules/c06_secret_access"
  secret_id = var.secret_id_github
  service_account_email = local.cloud_build_service_account_email

  depends_on = [ module.enable_apis, module.github_token_secret ]
}



