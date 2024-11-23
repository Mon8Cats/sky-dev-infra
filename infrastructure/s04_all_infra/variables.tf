
# common ##############################################
variable "project_id" {
  description = "Project ID for the GCP project"
  type        = string
}

variable "project_number" {
  description = "Project ID for the GCP project"
  type        = string
}

variable "region" {
  description = "Region in which GCP Resources to be created"
  type = string
  default = "us-east1"
}


# apis
variable "api_list" {
  type        = list(string)
  description = "A list of APIs"
  #default     = ["value1", "value2", "value3"]  # optional default value
}


variable "github_connection_name" {
  description = "The region for the resources"
  type        = string
}

variable "secret_id_github" {
  description = "The region for the resources"
  type        = string
}

variable "github_app_installation_id" {
  description = "The region for the resources"
  type        = string
}

variable "github_account" {
  description = "The region for the resources"
  type        = string
}

variable "secret_id_db_user" {
  description = "The region for the resources"
  type        = string
}

variable "secret_id_db_password" {
  description = "The region for the resources"
  type        = string
}

# infra ##############################
variable "cicd_sa_name_infra" {
  description = "The ID of the service account to create (must be unique within the project)"
  type        = string
}

variable "cicd_sa_role_list_infra" {
  type        = list(string)
  description = "A list of APIs"
  #default     = ["value1", "value2", "value3"]  # optional default value
}

# workload identity

variable "wi_pool_id_infra" {
  description = "The Workload Identity Pool Id"
  type        = string
}

variable "wi_pool_name_infra" {
  description = "The Workload Identity Pool Name"
  type        = string
}

variable "wi_pool_provider_id_infra" {
  description = "The Workload Identity Provider Id"
  type        = string
}

variable "github_repository_infra" {
  description = "The region for the resources"
  type        = string
}


variable "github_repo_uri_infra" {
  description = "The region for the resources"
  type        = string
}

variable "repo_name_in_gcp_infra" {
  description = "The region for the resources"
  type        = string
}



variable "github_repo_name_infra" {
  description = "The region for the resources"
  type        = string
}

# app #############################
variable "cicd_sa_name_app" {
  description = "The ID of the service account to create (must be unique within the project)"
  type        = string
}

variable "cicd_sa_role_list_app" {
  type        = list(string)
  description = "A list of APIs"
  #default     = ["value1", "value2", "value3"]  # optional default value
}



variable "wi_pool_id_app" {
  description = "The Workload Identity Pool Id"
  type        = string
}

variable "wi_pool_name_app" {
  description = "The Workload Identity Pool Name"
  type        = string
}

variable "wi_pool_provider_id_app" {
  description = "The Workload Identity Provider Id"
  type        = string
}

variable "github_repository_app" {
  description = "The region for the resources"
  type        = string
}

variable "github_repo_uri_app" {
  description = "The region for the resources"
  type        = string
}

variable "repo_name_in_gcp_app" {
  description = "The region for the resources"
  type        = string
}


variable "github_repo_name_app" {
  description = "The region for the resources"
  type        = string
}
