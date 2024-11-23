# common 
variable "project_id" {
  description = "Project ID for the GCP project"
  type        = string
}

variable "project_number" {
  description = "Project number for the GCP project"
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


# secret
variable "secret_id_github" {
  description = "The Github Token Secret Id"
  type        = string
}

variable "secret_id_db_user" {
  description = "The db user Secret Id"
  type        = string
}

variable "secret_id_db_password" {
  description = "The db user Secret Id"
  type        = string
}

###

variable "secret_value_github" {
  description = "The Github Token Secret value"
  type        = string
}

variable "secret_value_db_user" {
  description = "The db user Secret value"
  type        = string
}


variable "secret_value_db_password" {
  description = "The db password Secret value"
  type        = string
}