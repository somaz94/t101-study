provider "aws" {
  region = "ap-northeast-2"
}

# resource "aws_s3_bucket" "tf_state" {
#   bucket = "somaz-terraform-state-bucket"

#   tags = {
#     Name        = "Terraform State Bucket"
#     Environment = "Somaz"
#   }
# }

# resource "aws_s3_bucket_versioning" "tf_state_versioning" {
#   bucket = aws_s3_bucket.tf_state.bucket

#   versioning_configuration {
#     status = "Enabled"
#   }
# }
