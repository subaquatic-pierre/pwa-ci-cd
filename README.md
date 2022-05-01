# Progressive Web Application CI /CD Infrastructure

Infrastructure to host a React App on AWS S3. It provides SSL certificate and redirect from www to root domain

## Error

There is an error when creating AWS CloudFront distribution linked to AWS S3 bucket which is configured to redirect all requests.

The error origin is marked on line 98 in frontend/cloudfront.tf.

A Github Repo to re-create the issue is here:

<https://github.com/subaquatic-pierre/s3-webapp-infrastructure>

Note: You will need AWS Hosted zone for testing

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
   `git clone git@github.com:subaquatic-pierre/s3-webapp-infrastructure.git`

2. Edit and rename terraform.tfvars.bak

3. Run
   `terraform init`

4. Run
   `terraform apply`

5. Run
   `aws s3 cp index.html s3://$(terraform output main_bucket_name | tr -d \")/`

6. Go to domain_name in browser
   `terraform output domain_name`

7. Go to www_domain_name in browser
   `terraform output www_domain_name`

## Resources

- <https://aws.amazon.com/premiumsupport/knowledge-center/s3-website-cloudfront-error-403/>
