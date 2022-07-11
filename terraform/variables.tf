variable "instancetype" {
  type = string
  default = "t2.micro"
}

resource "aws_instance" "first_ec2_instance" {
  ami = "ami-08df646e18b182346"
  instance_type = var.my_instance_type
}

# terraform plan -var="instancetype=t2.small"

# File : terraform.tfvars
# instancetype="t2.small"

# terraform plan -var-file="custom.tfvars"
