

locals {
  cicd_service_account_email_infra = "${var.cicd_sa_name_infra}@${var.project_id}.iam.gserviceaccount.com"
  cicd_service_account_email_app = "${var.cicd_sa_name_app}@${var.project_id}.iam.gserviceaccount.com"
  #cicd_bucket_name           = "${var.project_id}-cicd-bucket"
  cloud_build_service_account_email = "service-${var.project_number}@gcp-sa-cloudbuild.iam.gserviceaccount.com"


  # globally unique names
  wi_pool_id_infra = "${wi-pool-id-infra}-${var.project_id}"
  wi_pool_name_infra = "${wi-pool-name-infra}-${var.project_id}"
  wi_pool_provider_id_infra = "${wi-pool-provider-id-infra}-${var.project_id}"

  wi_pool_id_app = "${wi-pool-id-app}-${var.project_id}"
  wi_pool_name_app = "${wi-pool-name-app}-${var.project_id}"
  wi_pool_provider_id_app = "${wi-pool-provider-id-app}-${var.project_id}"

}