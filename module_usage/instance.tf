provider "aws" {
  region  = "eu-west-1"
  profile = "it-sandbox"
}


module "ec2module" {
    source = "../modules/ec2"
    instance_name = "jamal-ec2"
    ami_id = "ami-01dd271720c1ba44f"
}