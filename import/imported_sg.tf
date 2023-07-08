# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "sg-036a30ccfb2ea853b"
resource "aws_security_group" "jamal_sg" {
  description = "Allow port 80 and ssh from SP"
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "Allow everything outbound"
    from_port        = 0
    ipv6_cidr_blocks = ["::/0"]
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]
  ingress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "Allow HTTPS"
    from_port        = 443
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 443
    }, {
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "TLS from VPC"
    from_port        = 80
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 80
    }, {
    cidr_blocks      = ["188.39.149.98/32"]
    description      = "SSH"
    from_port        = 22
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 22
  }]
  name                   = "sg_jamal_server"
  name_prefix            = null
  revoke_rules_on_delete = null
  tags = {
    Name = "sg_jamal_server"
  }
  tags_all = {
    Name = "sg_jamal_server"
  }
  vpc_id = "vpc-05e90d7c"
}


output "sg_arn" {
  value = aws_security_group.jamal_sg.arn
}
