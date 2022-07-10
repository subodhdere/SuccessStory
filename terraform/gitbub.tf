terraform {
  required_providers {
    github = {
      source = "integrations/github"
      version = "4.26.1"
    }
  }
}

provider "github" {
  token = "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"
}

resource "github_repository" "repo77" {
  name        = "my-demo-terraform-repo"
  description = "My awesome codebase"
  visibility = "public"
}
