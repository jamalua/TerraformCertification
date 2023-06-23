provider "aws" {
  region  = "eu-west-1"
  profile = "it-sandbox"
}

resource "aws_instance" "jamal-ec2" {
  instance_type = "t2.micro"
  ami           = "ami-00b1c9efd33fda707"
}

resource "aws_eip" "elastic_ip" {
  domain = "vpc"
}

resource "aws_security_group" "allow_tls" {
  name = "jamal_test_security_group"

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = [ join("", [aws_eip.elastic_ip.public_ip, "/32"])]
  }
}

resource "aws_eip_association" "eip_assoc" {
  instance_id = aws_instance.jamal-ec2.id
  allocation_id = aws_eip.elastic_ip.id
}

output "everything" {
  value = aws_instance.jamal-ec2
}