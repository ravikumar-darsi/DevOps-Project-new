provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "demo-server" {
    ami = "ami-0900fe555666598a2"
    instance_type = "t2.micro"
    key_name = "dpp"
    security_groups = [ "demo-sg-new" ]
}

resource "aws_security_group" "demo-sg-new" {
  name        = "demo-sg-new"
  description = "SSH Access"
  
  ingress {
    description      = "Shh access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "ssh-port"

  }
}