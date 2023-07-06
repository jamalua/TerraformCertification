provider "aws" {
  region  = "eu-west-1"
  profile = "it-sandbox"
}


resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow ssh inbound traffic"

  ingress {
    description = "Allow SSH inbound"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "allow everything outbound"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "myec2" {
  ami                    = "ami-05432c5a0f7b1bfd0"
  instance_type          = "t2.micro"
  key_name               = "jamal-terraform-key"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("./jamal-terraform-key.pem")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    when       = create
    on_failure = fail
    inline = [
      "sudo yum -y install nano"
    ]
  }

  provisioner "remote-exec" {
    when       = destroy
    on_failure = continue
    inline = [
      "sudo yum -y remove nano"
    ]
  }
}
