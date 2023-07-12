provider "aws" {
  region  = "us-east-1"
  profile = "it-sandbox"
}

import {
  to = aws_wafv2_web_acl.cmr_acl
  id = "3de83085-409a-4663-8504-6bb84b76d1d4/CreatedByCloudFront-9edf4058-580c-49de-80af-1ae728cb9c47/CLOUDFRONT"
}
