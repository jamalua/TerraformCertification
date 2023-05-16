resource "aws_instance" "jamal-server" {
  ami           = "ami-09fd16644beea3565"
  instance_type = instance_type

  tags = {
    Name = "jamal-server"
  }

}