# (1) project id
#project_id = "sky-root"
#project_number = "650839457214"
#region     = "my region" # "us-central1"
#bucket_name = "mon8cats-lab-tf-backend" # unique


# (2) api list
api_list   = [
    "secretmanager.googleapis.com", # manually enabled
    "cloudbuild.googleapis.com",
  ]

# (5) Secret
secret_id_github = "github_token"
secret_id_db_user = "db_user"
secret_id_db_password = "db_password"

secret_data_github = "github_token"
secret_data_db_user = "db_user"
secret_data_db_password = "db_password"