terraform {
  cloud {
    organization = "TerrafromCertification"

    workspaces {
      name = "CertificationPractice"
    }
  }
}

provider "aws" {
  region  = "eu-west-1"
}

resource "aws_instance" "jamal_ec2_dev" {
  instance_type = "t2.micro"
  ami           = "ami-00b1c9efd33fda707"
}
