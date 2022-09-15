resource "aws_instance" "myec2" {
   ami = "ami-06489866022e12a14"
   instance_type = "t2.micro"
}

output "public_ip" {
  value = aws_instance.myec2.public_ip
}
