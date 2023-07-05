provider "aws" {
  region  = "eu-west-1"
  profile = "it-sandbox"
}

resource "aws_instance" "jamal_remote" {
  ami = "ami-05432c5a0f7b1bfd0"
  instance_type = "t2.micro"
  key_name = "jamal-terraform-key"

  connection {
    type = "ssh"
    user = "ec2-user"
    private_key = file("./jamal-terraform-key.pem")
    host = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [ 
        "sudo amazon-linux-extras install -y nginx1",
        "sudo systemctl start nginx"
     ]
    
  }
}