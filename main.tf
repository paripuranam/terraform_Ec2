provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "demoInstance" {
  ami = "ami-08fe36427228eddc4"
  instance_type = "t2.micro"
  # subnet_id = "subnet-08d3212e095e8bfa8"
  user_data = "${file("userdata.sh")}"


  tags = {
    Name = "terraform-example"
  }
}

output "public_ip" {
  value = aws_instance.demoInstance.public_ip
}

# resource "aws_security_group" "Instance-Sg" {
#   name = "demo-sg"
#   vpc_id = "vpc-0fa4fb301ee8c28d2"
#   ingress {
#     from_port = 80
#     to_port = 80
#     protocol = "tcp"
#     cidr_blocks = [ "0.0.0.0/0" ]
#   }
#   egress {
#     from_port = 0
#     to_port = 0
#     protocol = "-1"
#     cidr_blocks = [ "0.0.0.0/0" ]
#   }
#   tags = {
#     name = "tf-sg"
#   }
