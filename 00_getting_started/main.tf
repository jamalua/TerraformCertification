resource "aws_instance" "my_server" {
  ami           = "ami-09fd16644beea3565"
  instance_type = "t2.micro"

  tags = {
    Name = "MyServer"
  }

}