resource "aws_s3_bucket" "this" {
  bucket = "fe-static-codechallenges"

  tags = {
    Name    = "tf-state"
    project = "codechallenge"
  }
}
# resource "aws_s3_bucket_acl" "b_acl" {
#   bucket = aws_s3_bucket.this.id
#   acl    = "private"
# }

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id
  versioning_configuration {
    status = "Enabled"
  }
}

