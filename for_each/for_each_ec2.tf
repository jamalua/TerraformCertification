provider "aws" {
  region  = "eu-west-1"
  profile = "it-sandbox"
}

locals {
  vms = {
    vm1 = {
      "ec2_type" = "t2.micro"
      "name"     = "jamal-ec2-1"
      "some_tag" = "alpha"
    }
    vm2 = {
      "ec2_type" = "t2.medium"
      "name"     = "jamal-ec2-2"
      "some_tag" = "beta"
    }
    vm3 = {
      "ec2_type" = "t2.large"
      "name"     = "jamal-ec2-3"
      "some_tag" = "gama"
    }

  }
}

resource "aws_instance" "myec2" {
  ami           = "ami-05432c5a0f7b1bfd0"
  for_each      = local.vms
  instance_type = each.value["ec2_type"]
  tags = {
    Name = each.value["name"]
    New  = each.value["some_tag"]
  }
}

output "jamal-vms" {
  # value = aws_instance.myec2["vm1"].arn
  # value = [ for vm, prperties in local.vms : aws_instance.myec2[vm].id ]
  value = { for vm in keys(local.vms) : vm => aws_instance.myec2[vm].id }
}