provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      env = local.env
      project = "codechallenge"
    }
  }
}

terraform {
  backend "s3" {
    bucket = "tf-state-codechallenges"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}

locals {
  branch_name = split("refs/heads/", var.branch_ref)[1]
  env = local.branch_name == "main" ? "prod": local.branch_name
}
