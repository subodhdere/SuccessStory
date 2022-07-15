resource "aws_instance" "web" {
  ami           = "ami-08df646e18b182346"
  instance_type = "t2.micro"
  key_name = "deployer-key"
  vpc_security_group_ids = ["sg-08ddeaa543562015d"]

  tags = {
    Name = "HelloWorld"
  }
}

# terraform init
# terraform import aws_instance.web i-061216e28f3d7d50b
