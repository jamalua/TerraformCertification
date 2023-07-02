provider "aws" {
  region  = "eu-west-1"
  profile = "it-sandbox"
}

variable "elb_names" {
    type = list
    default = ["dev_loadblancer", "stage_loadbalancer", "prod_loadbalancer"]
}


resource "aws_instance" "jamal-ec2" {
  instance_type = "t2.micro"
  ami           = "ami-00b1c9efd33fda707"
  count = 3

  tags = {
    Name = var.elb_names[count.index]
  }
}


output "instances" {
    value = aws_instance.jamal-ec2.1.id
  
}