/* No space around =
export TF_VAR_project_id="mon-cloud-lab"
export TF_VAR_project_number="583630435909"
export TF_VAR_region="us-central1"
echo $TF_VAR_project_id
echo $TF_VAR_region
*/

# project_id
# project_number
# region

subnet_ip_range  = "10.128.0.0/20"

vpc_name = "mon-vpc"
subnet_name = "mon-subnet"
subnet_region = "us-central1"

artifact_registry_id = "mon-artifacts"