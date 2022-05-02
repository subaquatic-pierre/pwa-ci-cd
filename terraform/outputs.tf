# Output value definitions
output "domain_name" {
  description = "Domain name"
  value = "https://${var.domain_name}"
}

output "www_domain_name" {
  description = "Domain name"
  value = "https://www.${var.domain_name}"
}

output "staging_domain_name" {
  description = "Staging name"
  value = "https://staging.${var.domain_name}"
}


# -----
# CICD CREDENTIALS
# -----

# MAIN 

output "main_cloudfront_dist_id" {
  description = "MAIN_CLOUDFRONT_DISTRIBUTION_ID"
  value = module.frontend.main_cloudfront_dist_id
}
output "main_s3_bucket_id" {
  description = "MAIN_S3_BUCKET_ID"
  value = module.frontend.main_s3_bucket_id
}

output "main_s3_bucket_region" {
  description = "MAIN_S3_BUCKET_REGION"
  value = module.frontend.main_s3_bucket_region
}

# STAGING 

output "staging_cloudfront_dist_id" {
  description = "STAGING_CLOUDFRONT_DISTRIBUTION_ID"
  value = module.frontend.staging_cloudfront_dist_id
}
output "staging_s3_bucket_id" {
  description = "STAGING_S3_BUCKET_ID"
  value = module.frontend.staging_s3_bucket_id
}

output "staging_s3_bucket_region" {
  description = "STAGING_S3_BUCKET_REGION"
  value = module.frontend.staging_s3_bucket_region
}

# Module Frontend

# output "main_bucket_name" {
#   description = "Main name for static hosting bucket"

#   value = module.frontend.main_bucket_name
# }

# output "redirect_bucket_domain_name" {
#   description = "Domain name for redirect bucket"

#   value = module.frontend.redirect_bucket_domain_name
# }

# output "main_bucket_domain_name" {
#   description = "Domain name for main bucket"

#   value = module.frontend.main_bucket_domain_name
# }

# output "main_bucket_website_config_website_endpoint" {
#   description = "Domain name for main bucket website config"

#   value = module.frontend.main_bucket_website_config_website_endpoint
# }

# output "redirect_bucket_website_config_website_endpoint" {
#   description = "Domain name for main bucket website config"

#   value = module.frontend.redirect_bucket_website_config_website_endpoint
# }

