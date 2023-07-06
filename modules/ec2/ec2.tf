data "aws_ami" "module_ami" {
    most_recent = true
    owners = ["amazon"]

    filter {
      name = "name"
      values = ["amzn2-ami-hvm*"]
    }
  
}

resource "aws_instance" "jamal_ec2" {
  ami = var.ami_id != null ? var.ami_id : data.aws_ami.module_ami.id
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}