provider "aws" {
  region  = "eu-west-1"
  profile = "it-sandbox"
}

variable "is_test" {
  type    = bool
  default = true
}


resource "aws_instance" "jamal_ec2_dev" {
  instance_type = "t2.micro"
  ami           = "ami-00b1c9efd33fda707"
  count         = var.is_test == true ? 3 : 0
}

resource "aws_instance" "jamal_ec2_prod" {
  instance_type = "t2.micro"
  ami           = "ami-00b1c9efd33fda707"
  count         = var.is_test == false ? 1 : 0
}


