provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "mumbai_server" {
  ami           = "ami-078264b8ba71bc45e"
  key_name      = "newmumbai"
  instance_type = "t2.micro"
  subnet_id     = "subnet-0e80b6ffb5e18b2a4" # Replace with your subnet ID

tags = {
    Name = "riddhi_server"
  }
}

output "created_server" {
  value = aws_instance.mumbai_server.public_ip
}
