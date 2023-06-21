terraform {
  required_providers {
    aws = {
        version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}