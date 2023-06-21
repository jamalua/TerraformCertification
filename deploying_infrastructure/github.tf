terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "5.28.0"
    }
  }
}

provider "github" {
  token = "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"
}

resource "github_repository" "example" {
  name        = "terrafrom-created-repo"
  description = "My awesome codebase"

  visibility = "public"

}