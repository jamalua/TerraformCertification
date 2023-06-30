provider "aws" {
  region  = "eu-west-1"
  profile = "it-sandbox"
}

locals {
  time = formatdate("DD MM YYYY", timestamp())
}

variable "region" {
  default = "eu-west-1"
}

variable "ami" {
  type = map(any)
  default = {
    "eu-west-1" = "ami-05432c5a0f7b1bfd0"
    "eu-west-2" = "ami-038056f5d3df2259d"
  }
}

variable "tags" {
  type    = list(any)
  default = ["firstec2", "secondec2"]
}

resource "aws_key_pair" "loginkey" {
  key_name   = "login-key"
  public_key = file("${path.module}/id_rsa.pub")
}

resource "aws_instance" "name" {
  ami           = lookup(var.ami, var.region)
  instance_type = "t2.micro"
  key_name      = aws_key_pair.loginkey.key_name
  count         = 2

  tags = {
    Name = element(var.tags, count.index)
  }
}

output "timestamp" {
  value = local.time
}
