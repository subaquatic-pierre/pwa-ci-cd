variable "aws_account_id" {
  type        = string
  description = "AWS account if to be used in pipeline"
}

# ------
# Repositories
# ------

variable "tags" {
  type        = map(string)
  description = "Tags to be used in the project"
}

# ------
# Domain Variables
# ------

variable "domain_name" {
  type        = string
  description = "Root Route53 domain name"
}




