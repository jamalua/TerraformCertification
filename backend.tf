terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "TerrafromCertification"

    workspaces {
      name = "TerraformCertification"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.66.1"
    }
  }
}