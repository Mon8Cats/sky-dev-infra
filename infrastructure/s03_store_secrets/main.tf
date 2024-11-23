/* No space around =
export TF_VAR_project_id="sky-root"
export TF_VAR_project_number="262659146932"
export TF_VAR_region="us-central1"
echo $TF_VAR_project_id
echo $TF_VAR_region
*/

# generate github token
# click my profile / settings / developer settings / personal access tokens
# / tokens (classic) / generate new token /


# secrete store
module "secret_store_github_token" {
  source              = "../../modules/c07_secret_store"
  project_id          = var.project_id
  secret_id         = var.secret_id_github
  secret_value = var.secret_value_github
}

module "secret_store_db_user" {
  source              = "../../modules/c07_secret_store"
  project_id          = var.project_id
  secret_id         = var.secret_id_github
  secret_value = var.secret_value_db_user
}

module "secret_store_db_password" {
  source              = "../../modules/c07_secret_store"
  project_id          = var.project_id
  secret_id         = var.secret_id_github
  secret_value = var.secret_value_db_password
}





