# s3-webapp-infrastructure

Infrastructure to host a React App on AWS S3. It provides SSL certificate and redirect from www to root domain

## Error

## Cloudfront S3 Redirect Domain Error

As shown in AWS Solution in Resources section, it is necessary to format CloudFront Origin Name name as such.

`DOC-EXAMPLE-BUCKET.s3-website-us-east-1.amazonaws.com`

For normal static website hosting the

`aws_s3_bucket.main.bucket_domain_name`

seems to work but with redirect bucket a 403 AccessDenied error is thrown whn trying to connect to redirect bucket from redirect cloudfront

## Expected

Use

`aws_s3_bucket_website_configuration.redirect.website_endpoint`

as cloudfront Origin DomainName

instead of

`aws_s3_bucket.redirect.bucket_domain_name`

## Error message

`Error: error updating CloudFront Distribution (***): InvalidArgument: The parameter Origin DomainName does not refer to a valid S3 bucket.`

## Steps to reproduce error

1. Clone repo
2. Edit and rename terraform.tfvars.bak
3. Run
`terraform init`

4. Run
`aws s3 cp index.html s3://$(terraform output main_bucket_name)/`

5. Go to domain_name in browser
`terraform output domain_name`

5. Go to www_domain_name in browser
`terraform output www_domain_name`

## Resources

- <https://aws.amazon.com/premiumsupport/knowledge-center/s3-website-cloudfront-error-403/>
