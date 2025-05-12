provider "aws" {
region = "ap-south-1"
}
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "my_vpc"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"
 availability_zone = "ap-south-1a
  tags = {
    Name = "public_subnet"
  }

}
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-south-1b
  tags = {
    Name = "private_subnet"
  }
}
resource "aws_instance" "beed_server" {
  ami           = "ami-078264b8ba71bc45e"
  key_name      = "newmumbai"
  instance_type = "t2.micro"
  count = 1
  subnet_id     = aws_subnet.public_subnet.id #  Launch in the public subnet

  tags = {
    Name = "radhe_server-1"
  }
}
  resource "aws_instance" "pune_server" {
  ami           = "ami-078264b8ba71bc45e"
  key_name      = "newmumbai"
  instance_type = "t2.micro"
  count = 1
  subnet_id     = aws_subnet.private_subnet.id #  Launch in the public subnet

  tags = {
    Name = "radhe_server-2"
  }
  }
  output "created_server_public_ip" {
  value = aws_instance.mumbai_server.public_ip
}

output "created_server_private_ip" {
  value = aws_instance.mumbai_server.private_ip
} 

output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "private_subnet_id" {
  value = aws_subnet.private_subnet.id
}
