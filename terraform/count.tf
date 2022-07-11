variable "iam_user_name" {
  type = list
  default = [ "user1","user2","user3","user4","user5" ]
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
  access_key = "<access_key>"
  secret_key = "<secret_key>"
}

resource "aws_iam_user" "myiamuser" {
  name = var.iam_user_name[count.index]
  count = 5
  path = "/system/"
}











