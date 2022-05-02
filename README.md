# Progressive Web Application CI /CD Infrastructure

Infrastructure to host a Progressive Web Application with AWS S3. It provides SSL certificate and redirect from www to root domain. It features a staging domain for testing as well as Github actions for test automation and deployment.

## Main Features

- :star: Progressive Web Application application hosted on AWS S3
- :star: GitHub CI / CD actions for tests automation and deployment.
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

## Development Cycle

Your repository should have 3 branches

- `main`
- `staging`
- `dev`

1. All active development will happen on the `dev` branch. Any push to the dev branch will start the CI/CD action. It will run all tests associated with you application.

2. Once you have verified the tests are passing you will merge the `dev` branch with the staging branch. This will kick off the next action. The CI/CD pipeline will run the tests again, if the tests pass it will the deploy your application to to staging.domain.com

3. Once you have confirmed everything is working on the staging area you can then merge you `staging` branch with the `main`branch. This will kick off the last action which will run tests again, if all tests pass it will deploy you application to the main domain.

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
