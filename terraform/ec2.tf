provider "aws" {
  region = "ap-south-1"
  access_key = "<access_key>"
  secret_key = "<secret_key>"
}

resource "aws_instance" "first_ec2_instance" {
  ami = "ami-08df646e18b182346"
  instance_type = "t2.micro"
#  count = 1
#  key_name = "ec2-key"
}

resource "aws_eip" "lb" {
  vpc      = true
}

output "eip" {
  value = aws_eip.lb
}
