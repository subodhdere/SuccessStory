terraform {
  backend "s3" {
    bucket = "sss-terraform-state-backed"
    key    = "successstory/terraform.tfstate"
    region = "ap-south-1"
#    access_key = "YOUR-ACCESS-KEY"
#    secret_key = "YOUR-SECRET-KEY"
#    dynamodb_table = "s3-state-lock"
  }
}

# Note : The Dynamodb table must have a partition key named LockID with type of String
