resource "aws_s3_bucket" "this" {
  bucket = "fe-static-codechallenges-${local.env}"
}

resource "aws_s3_bucket_policy" "cloudfront_policy" {
  bucket = aws_s3_bucket.this.id
  policy = data.aws_iam_policy_document.cloudfront_access.json
}

data "aws_iam_policy_document" "cloudfront_access" {
  statement {
    sid       = "AllowCloudFrontServicePrincipal"
    effect    = "Allow"
    actions   = ["s3:GetObject"]
    resources = ["arn:aws:s3:::fe-static-codechallenges-${local.env}/*"]

    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }

    condition {
      test     = "StringEquals"
      variable = "aws:SourceArn"
      values   = ["arn:aws:cloudfront::${local.account_id}:distribution/${aws_cloudfront_distribution.this.id}"]
    }
  }
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id
  versioning_configuration {
    status = "Enabled"
  }
}

