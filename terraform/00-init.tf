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

data "aws_caller_identity" "current" {}
locals {
  account_id = data.aws_caller_identity.current.account_id
  env        = var.branch_name
}

