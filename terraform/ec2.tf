resource "aws_instance" "first_ec2_instance" {
  ami = "ami-08df646e18b182346"
  instance_type = "t2.micro"
  count = 1
  key_name = "ec2-key"
  vpc_security_group_ids  = [aws_security_group.allow_ssh.id]
}