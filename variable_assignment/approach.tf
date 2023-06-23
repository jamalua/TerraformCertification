provider "aws" {
  region  = "eu-west-1"
  profile = "it-sandbox"
}

resource "aws_instance" "jamal-ec2" {
  instance_type = var.instance_size
  ami           = "ami-00b1c9efd33fda707"
}
