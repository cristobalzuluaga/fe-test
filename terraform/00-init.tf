provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      env     = local.env
      project = "codechallenge"
    }
  }
}

terraform {
  backend "s3" {
    bucket = "tf-state-codechallenges"
    region = "us-east-1"
  }
}

locals {
  env = var.branch_name
}
