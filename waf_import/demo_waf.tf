# Define your provider and region
provider "aws" {
  region = "us-east-1"  # Replace with your desired region
}

# Create the AWS WAF v2 web ACL
resource "aws_wafv2_web_acl" "my_web_acl" {
  name        = "MyWebACL"
  description = "My AWS WAF v2 Web ACL"
  scope       = "CLOUDFRONT"

  # Define your managed rules
  rule {
    name     = "AWSManagedRulesAmazonIpReputationList"
    priority = 1
    action {
      block {}
    }
    override_action {
      count {}
    }
    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesAmazonIpReputationList"
        vendor_name = "AWS"
      }
    }
    visibility_config {
      sampled_requests_enabled     = true
      cloudwatch_metrics_enabled   = true
      metric_name                  = "AmazonIpReputationListRule"
    }
  }

  # Define your custom rule
  rule {
    name     = "AllowTrafficFromCustomIPRange"
    priority = 2
    action {
      allow {}
    }
    statement {
      ip_set_reference_statement {
        arn = aws_wafv2_ip_set.custom_ip_set.arn
      }
    }
  }
}

# Create the AWS CloudFront distribution
resource "aws_cloudfront_distribution" "my_distribution" {
  # Define your distribution properties
  enabled             = true
  comment             = "My CloudFront Distribution"
  default_root_object = "index.html"

  # Define the origin configuration
  origin {
    domain_name = "example.com"  # Replace with your origin domain
    origin_id   = "my_origin"
  }

  # Define cache behavior
  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "my_origin"

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
  }

  # Define viewer certificate
  viewer_certificate {
    cloudfront_default_certificate = true
  }

  # Associate the AWS WAF v2 web ACL
  web_acl_id = aws_wafv2_web_acl.my_web_acl.id
}

# Create a custom IP set for the allowed IP range
resource "aws_wafv2_ip_set" "custom_ip_set" {
  name        = "MyCustomIPSet"
  description = "Custom IP Set for Allowed IP Range"
  scope       = "CLOUDFRONT"

  ip_set_descriptor {
    type  = "IPV4"
    value = "10.0.0.0/16"
  }
}
