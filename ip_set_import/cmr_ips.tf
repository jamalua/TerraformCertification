# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "2b8c2af3-0f3e-4cfc-af57-de120f4bd58c/CMR-IPs/CLOUDFRONT"
resource "aws_wafv2_ip_set" "cmr_ips" {
  addresses          = ["167.98.114.112/29"]
  description        = "IP addresses owned by CMR"
  ip_address_version = "IPV4"
  name               = "CMR-IPs"
  scope              = "CLOUDFRONT"
  tags               = {}
  tags_all           = {}
}

