# Terraform Settings Block
terraform {
  required_version = ">= 1.9"
  required_providers {
    google = {
      source = "hashicorp/google"
      version = ">= 6.0.0"
    }
  }

  backend "gcs" {
    bucket = "skyroot-tf-backend"
    prefix  = "terraform/dev/cicd"  
  }
}

# Terraform Provider Block
provider "google" {
  project = var.project_id
  region = var.project_region
}