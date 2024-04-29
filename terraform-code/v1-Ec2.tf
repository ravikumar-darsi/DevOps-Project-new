provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "demo-server" {
    ami = "ami-0e0bf53f6def86294"
    instance_type = "t2.micro"
    key_name = "dpp"
}