provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "tf-state-codechallenges"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}
