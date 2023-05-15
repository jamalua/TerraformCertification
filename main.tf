terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.66.1"
    }
  }
}

provider "aws" {
  profile = "it-sandbox"
  region  = "eu-west-1"
}

resource "aws_instance" "my_server" {
  ami           = "ami-09fd16644beea3565"
  instance_type = "t2.micro"

  tags = {
    Name = "MyServer"
  }

}