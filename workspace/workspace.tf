provider "aws" {
  region  = "eu-west-1"
  profile = "it-sandbox"
}

resource "aws_instance" "jamal-ec2" {
  instance_type = lookup(var.ec2_type, terraform.workspace)
  ami           = "ami-00b1c9efd33fda707"
}


variable "ec2_type" {
  type = map(any)
  default = {
    default = "t2.nano"
    dev     = "t2.micro"
    prd     = "t2.large"
  }
}