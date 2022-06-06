# curriculum-vitae
[Online curriculum vitae](https://wasta-geek.github.io/curriculum-vitae) - Corentin Ducatez

This curriculum is currently available in the following languages:
  - French
  - English

## Technologies

This curriculum uses the following frameworks/tools:
  - [Jekyll](https://jekyllrb.com/): build the website from html/.md files into a static website
  - [Github pages](https://pages.github.com/): manages the upload/hosting of the static website
  - [Bootstrap](https://getbootstrap.com/): CSS framework
  - HTML / CSS / JS
  - [Docker](https://www.docker.com/https://www.docker.com/): used to test locally the website; converts the static website into pdf files (custom image) and upload pdf files to AWS s3 bucket
  - [Terraform](https://www.terraform.io/): used to manages the AWS s3 bucket infrastructure

## Infrastructure

The infrastructure used for this project is Github Pages for the hosting and AWS s3 for files hosting (pdf files here). AWS S3 buckets are managed via terraform (see terraform folder).
Temporary S3 buckets are created for each pull requests to be able to visualize the given PR as an already built website.

## Github Action

The following steps are executed at each push of the website:
  - Build of the PDF files (custom Docker image)
  - Upload those files to an AWS S3 bucket
  - Uploading of the website (Github pages part)
  - Archive the PDF files

In case the Dockerfile changes, the docker image for building pdf files will be rebuild and pushed to the Github package registry.

At each PR (opened / modifed):
  - Check about the terraform files (fmt, plan success, ...)
  - A temporary S3 bucket is created via terraform and configured for 'website hosting'
  - Add the terraform plan "log" in a comment of the PR
  - Upload the PDF files to this temporary S3 bucket
  - Archive PDF files
  - Archive Website build files (jekyll build)

When the PR is closed, the corresponding bucket is destroyed.