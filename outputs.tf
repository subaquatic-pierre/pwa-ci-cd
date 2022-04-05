# Output value definitions
output "domain_name" {
  description = "Domain name"

  value = "https://${var.domain_name}"
}

output "www_domain_name" {
  description = "Domain name"

  value = "https://www.${var.domain_name}"
}



# Module Frontend

output "main_bucket_name" {
  description = "Main name for static hosting bucket"

  value = module.frontend.main_bucket_name
}


output "redirect_bucket_domain_name" {
  description = "Domain name for redirect bucket"

  value = module.frontend.redirect_bucket_domain_name
}


output "main_bucket_domain_name" {
  description = "Domain name for main bucket"

  value = module.frontend.main_bucket_domain_name
}

output "main_bucket_website_config_website_endpoint" {
  description = "Domain name for main bucket website config"

  value = module.frontend.main_bucket_website_config_website_endpoint
}

output "redirect_bucket_website_config_website_endpoint" {
  description = "Domain name for main bucket website config"

  value = module.frontend.redirect_bucket_website_config_website_endpoint
}

