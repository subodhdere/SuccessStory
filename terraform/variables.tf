variable "my_instance_type" {
  type = string
  default = "t2.micro"
}

resource "aws_instance" "first_ec2_instance" {
  ami = "ami-08df646e18b182346"
  instance_type = var.my_instance_type
}

# terraform plan -var="my_instance_type=t2.small"

# File : terraform.tfvars
# my_instance_type="t2.small"

# terraform plan -var-file="custom.tfvars"

# setx TF_VAR_my_instance_type m5.large
