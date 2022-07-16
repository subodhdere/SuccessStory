provider "aws" {
  region     = "ap-south-1"
  access_key = "YOUR-KEY"
  secret_key = "YOUR-KEY"
}

resource "aws_instance" "myec2" {
   ami = "ami-082b5a644766e0e6f"
   instance_type = var.list[1]
}

variable "list" {
  type = list
  default = ["m5.large","m5.xlarge","t2.medium"]
}

variable "types" {
  type = map
  default = {
    us-east-1 = "t2.micro"
    us-west-2 = "t2.nano"
    ap-south-1 = "t2.small"
  }
}

# terraform plan -var="my_instance_type=t2.small"

# File : terraform.tfvars
# my_instance_type="t2.small"

# terraform plan -var-file="custom.tfvars"

# setx TF_VAR_my_instance_type m5.large
Footer
