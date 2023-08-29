terraform {
  backend "s3" {
    bucket = "somaz-terraform-state-bucket"
    key    = "somaz/terraform/state"
    region = "ap-northeast-2"
    dynamodb_table = "terraform-up-and-running-locks"
  }
}
