module "my_module" {
  source = "git::https://github.com/somaz94/terraform-infra-gcp//modules/gcs_buckets?ref=main"

  names      = ["somaz-gcs-bucket"]
  project_id = "somaz-project"
  location   = "asia-northeast3"
} 
