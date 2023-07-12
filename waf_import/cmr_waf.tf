# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "3de83085-409a-4663-8504-6bb84b76d1d4/CreatedByCloudFront-9edf4058-580c-49de-80af-1ae728cb9c47/CLOUDFRONT"
resource "aws_wafv2_web_acl" "cmr_acl" {
  description   = null
  name          = "CreatedByCloudFront-9edf4058-580c-49de-80af-1ae728cb9c47"
  scope         = "CLOUDFRONT"
  tags          = {}
  tags_all      = {}
  token_domains = []
  default_action {
    allow {
    }
  }
  rule {
    name     = "AllowCMRIPs"
    priority = 3
    action {
      allow {
      }
    }
    statement {
      ip_set_reference_statement {
        arn = "arn:aws:wafv2:us-east-1:354149775542:global/ipset/CMR-IPs/2b8c2af3-0f3e-4cfc-af57-de120f4bd58c"
      }
    }
    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AllowCMRIPs"
      sampled_requests_enabled   = true
    }
  }
  rule {
    name     = "AWS-AWSManagedRulesAmazonIpReputationList"
    priority = 0
    override_action {
      none {
      }
    }
    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesAmazonIpReputationList"
        vendor_name = "AWS"
        version     = null
      }
    }
    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AWS-AWSManagedRulesAmazonIpReputationList"
      sampled_requests_enabled   = true
    }
  }
  rule {
    name     = "AWS-AWSManagedRulesCommonRuleSet"
    priority = 1
    override_action {
      none {
      }
    }
    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesCommonRuleSet"
        vendor_name = "AWS"
        version     = null
      }
    }
    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AWS-AWSManagedRulesCommonRuleSet"
      sampled_requests_enabled   = true
    }
  }
  rule {
    name     = "AWS-AWSManagedRulesKnownBadInputsRuleSet"
    priority = 2
    override_action {
      none {
      }
    }
    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesKnownBadInputsRuleSet"
        vendor_name = "AWS"
        version     = null
      }
    }
    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AWS-AWSManagedRulesKnownBadInputsRuleSet"
      sampled_requests_enabled   = true
    }
  }
  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "CreatedByCloudFront-9edf4058-580c-49de-80af-1ae728cb9c47"
    sampled_requests_enabled   = true
  }
}
