provider "aws" {
  region  = "eu-west-1"
  profile = "it-sandbox"
  alias   = "ireland"
}

provider "aws" {
  region  = "eu-west-2"
  profile = "it-sandbox"
  alias   = "uk"
}


resource "aws_eip" "eip_ireland" {
  provider = aws.ireland
}

resource "aws_eip" "eip_uk" {
  provider = aws.uk
}
