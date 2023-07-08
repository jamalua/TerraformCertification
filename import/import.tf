provider "aws" {
  region  = "eu-west-1"
  profile = "it-sandbox"
}

import {
  to = aws_security_group.jamal_sg
  id = "sg-036a30ccfb2ea853b"
}