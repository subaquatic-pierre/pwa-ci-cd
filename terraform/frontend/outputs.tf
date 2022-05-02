output "main_bucket_name" {
  description = "Main name for static hosting bucket"

  value = aws_s3_bucket.main.id
}
output "main_bucket_domain_name" {
  description = "Domain name for redirect bucket"

  value = aws_s3_bucket.main.bucket_domain_name
}

output "redirect_bucket_domain_name" {
  description = "Domain name for main bucket"

  value = aws_s3_bucket.redirect.bucket_domain_name
}

output "main_bucket_website_config_website_endpoint" {
  value = aws_s3_bucket_website_configuration.main.website_endpoint
}

output "redirect_bucket_website_config_website_endpoint" {
  value = aws_s3_bucket_website_configuration.redirect.website_endpoint
}

# -----
# CICD CREDENTIALS OUTPUTS
# -----

# MAIN 

output "main_cloudfront_dist_id" {
  description = "MAIN_CLOUDFRONT_DISTRIBUTION_ID"
  value = aws_cloudfront_distribution.main.id
}
output "main_s3_bucket_id" {
  description = "MAIN_S3_BUCKET_ID"
  value = aws_s3_bucket.main.id
}

output "main_s3_bucket_region" {
  description = "MAIN_S3_BUCKET_REGION"
  value = aws_s3_bucket.main.region
}

# STAGING 

output "staging_cloudfront_dist_id" {
  description = "MAIN_CLOUDFRONT_DISTRIBUTION_ID"
  value = aws_cloudfront_distribution.staging.id
}
output "staging_s3_bucket_id" {
  description = "MAIN_S3_BUCKET_ID"
  value = aws_s3_bucket.staging.id
}

output "staging_s3_bucket_region" {
  description = "MAIN_S3_BUCKET_REGION"
  value = aws_s3_bucket.staging.region
}



