locals {
  common_tags = {
    Owner = "DevOps Team"
    service = "backend"
  }
}
resource "aws_instance" "app-dev" {
   ami = "ami-08df646e18b182346"
   instance_type = "t2.micro"
   tags = local.common_tags
}