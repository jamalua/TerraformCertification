provider "aws" {
  region  = "us-east-1"
  profile = "it-sandbox"
}

import {
  to = aws_wafv2_ip_set.cmr_ips
  id = "2b8c2af3-0f3e-4cfc-af57-de120f4bd58c/CMR-IPs/CLOUDFRONT"
}
