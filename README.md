# Progressive Web Application CI /CD Infrastructure

Infrastructure and GitHub actions to test and deploy a Progressive Web Application hosted on AWS S3. It provides SSL certificate and redirects from `www.domain.com` to the root domain, ie `domain.com`. The pipeline also features a staging domain to verify the application is working as expected in a live environment, once verified the staging domain can be merged with the main branch which will trigger automatic deployment to the main domain.

## Main Features

- :star: Progressive Web Application application hosted on AWS S3
- :star: GitHub CI/CD actions for test automation and deployment
- :star: Application served on a worldwide CDN with AWS CloudFront
- :star: Secure connection with SSL certificate on AWS Route 53
- :star: Redirect all <http://www.domain.com> traffic to <https://domain.com>
- :star: Staging domain <http://staging.domain.com>

## Requirements

- :warning: Route 53 Hosted Domain
- :warning: Terraform CLI v1.1.8 or later

## Infrastructure Diagram

![alt Cloud Diagram](https://github.com/subaquatic-pierre/pwa-ci-cd/blob/main/assets/cloud-diagram.png?raw=true)

## How To

1. Clone the Repo
2. Copy your application source code into the `app/` directory
3. Run

   `cd terraform`

4. Run

   `terraform init`

5. Run

   `terraform plan -out plan`

6. Run

   `terraform apply`

### Set Github Secrets

Before the pipeline can deploy the application to the various domains the GitHub secrets will need to be configured. Follow this article if you dont know how to configure GitHub secrets:

[Configure Github Secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets#creating-encrypted-secrets-for-an-environment)

This is a list of all secrets which need to be added to Github actions:

- AWS_ACCESS_KEY_ID
- AWS_REGION
- AWS_SECRET_ACCESS_KEY
- MAIN_CLOUDFRONT_DISTRIBUTION_ID
- MAIN_S3_BUCKET_ID
- STAGING_CLOUDFRONT_DISTRIBUTION_ID
- STAGING_S3_BUCKET_ID

#### Credentials

These are found in the AWS console or your credential file in you home dir `$HOME/.aws/credentials`

- AWS_ACCESS_KEY_ID
- AWS_REGION
- AWS_SECRET_ACCESS_KEY

#### Terraform Outputs

These are found in the output from `terraform apply` command, or you can run `terraform output` to see the latest outputs.

- MAIN_CLOUDFRONT_DISTRIBUTION_ID - `main_cloudfront_dist_id`
- MAIN_S3_BUCKET_ID - `main_s3_bucket_id`
- STAGING_CLOUDFRONT_DISTRIBUTION_ID - `staging_cloudfront_dist_id`
- STAGING_S3_BUCKET_ID - `staging_s3_bucket_id`

## Development Cycle

The repository should have 3 branches

- `main`
- `staging`
- `dev`

1. All active development will happen on the `dev` branch. Any push to the dev branch will start the first CI action. It will run all tests associated with the application.

2. Once you have verified that the tests are passing you will merge the `dev` branch with the `staging` branch. This will kick off the next action. The CI/CD pipeline will run the tests again, if the tests pass it will the deploy the application to `staging.domain.com`

3. Once you have confirmed everything is working in the staging area you can merge the `staging` branch with the `main` branch. This will kick off the last action which will run tests again, if all tests pass it will deploy the application to the main domain, ie. `domain.com`.

## Notes

- If `terraform apply` command fails the first time, retry it again. It may be an issue with the creation order of AWS resources.
- Check the error below on how to fix redirect bucket issue.

---

## Error

Currently there is a small issue with the Terraform deployment. It has been raised on Github, you can find a reference to the issue here:

- [Github Issue](https://github.com/hashicorp/terraform-provider-aws/issues/24332)

There is an error when creating AWS CloudFront distribution linked to AWS S3 bucket which is configured to redirect all requests.

The issue prevents the redirect bucket from working. The solution for now is to manually update the origin in the AWS console to point to the correct bucket.

### Steps

1. Log into the AWS console
2. Navigate to CloudFront
3. Navigate to redirect Distribution
4. Under `origin` tab select `edit`
5. Change `Origin Domain` to `DOC-EXAMPLE-BUCKET.s3-website-us-east-1.amazonaws.com`

An example solution can be found at this AWS article:

- [AWS Knowledge Center](https://aws.amazon.com/premiumsupport/knowledge-center/s3-website-cloudfront-error-403/)
