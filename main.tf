resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCtpzM//FD9TWElDBp+LoJA4y9wnwEMgjZlBHAifpaVoI75iBrwWJooNLKITtkhgv5lzjiCHoC5k0i3p77VvLywNhSu8XAHTmJ0VlNH6LpHHy3nlDsEpye+MOTdcCAPOs/deSEqAOlHH726GD8UI0/TMupziu3TyVcO9Yf465L4u1Ynoa7XdLB8A/hNVcJAhcOQ/gEaHfqZ5jwAbbpYWF/na7oHpg+FgBcZEjO+AD3qDsihaf3CFbPEsvbpeKxIyY2QZZhXl0o81usGjJhd7ZxGSHodwjoIaCf5wG0Zwir4NqRTTZrrW0WqmN7c0Epfq49O/L4KfNYI2M+6SYAn+jUZX79wojkNQwwLhQFt9PtwEP834d43nbhSXu9kAwQTHUBwiSFm/BU9Ai0UF0mfvJ1frYb6vKCCkUjdf+3veAvsfkzPONIvEytcxdyUquXhmWtBgK6D+buuieiq76AKJUCEKjHr8kMKGaXkhifl8iByGh0un7EQF0wAUaEvxulqq9MUxGkjjrrp+W1EoPaxcTnzuYiszDMrcIEDNT/Wji0IwNjtbWzuy8hr5az7XTcXspnpofuMhF/xsjI2rmkNPmPJKNzXWY+gD+mEd4d3u6b+gScLjQRld4YGIDYHhMBqebi/qtzq2x6KcvtSK/k6GL5Ge8GG9YY/2y2qjTfpfjnxIw== jamal.ahmed@cmrlap59.cmedrobotics.local"
}

resource "aws_instance" "jamal_server" {
  ami           = "ami-09fd16644beea3565"
  instance_type = var.instance_type
  key_name = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.sg_jamal_server.id]
  user_data = data.template_file.user_data.rendered
  provisioner "file" {
    content = "mars"
    destination = "/home/ec2-user/barsoon.txt"
    connection {
      type = "ssh"
      user = "ec2-user"
      host = self.public_ip
      private_key = file("id_rsa")
    }
    
  }

  tags = {
    Name = "jamal-server"
  }

}

resource "aws_security_group" "sg_jamal_server" {
  name        = "sg_jamal_server"
  description = "Allow port 80 and ssh"
  vpc_id      = data.aws_vpc.main.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = []
  }

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["188.39.149.98/32"]
    ipv6_cidr_blocks = []
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "sg_jamal_server"
  }
}


data "aws_vpc" "main" {
  id = "vpc-05e90d7c"
}

data "template_file" "user_data" {
  template = file("./userdata.yml")
}