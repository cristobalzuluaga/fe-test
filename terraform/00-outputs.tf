output "cloudfront_dist" {
  value = aws_cloudfront_distribution.this.id
}

output "cloudfront_domain" {
  value = aws_cloudfront_distribution.this.domain_name
}

output "bucket_name" {
  value = aws_s3_bucket.this.id
}

output "env" {
  value = local.env
}
