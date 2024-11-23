resource "google_cloudbuildv2_repository" "my_repository" {
  location = var.region
  name = var.name_gcp_repo
  parent_connection = var.parent_connection
  remote_uri = var.remote_uri_repo
}
