terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region     = "eu-west-3"
  access_key = var.aws_credential.AWS_ACCESS_KEY_ID
  secret_key = var.aws_credential.AWS_SECRET_ACCESS_KEY
}

resource "aws_s3_bucket" "main_bucket" {
  bucket        = var.bucket_name
  force_destroy = true
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.main_bucket.bucket
  acl    = "public-read"

  depends_on = [aws_s3_bucket_public_access_block.public_access]
}

resource "aws_s3_bucket_website_configuration" "bucket_website_configuration" {
  bucket = aws_s3_bucket.main_bucket.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "404.html"
  }
}

resource "aws_s3_bucket_versioning" "versioning_enabled" {
  bucket = aws_s3_bucket.main_bucket.bucket
  versioning_configuration {
    status = "Enabled"
  }
}

## Lookup into the folder and retrieve a map containing each path/MIME/hash/...
module "website_files" {
  source   = "hashicorp/dir/template"
  base_dir = "../docs/_site"
}

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.main_bucket.bucket

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "policy_allow_public_access" {
  bucket = aws_s3_bucket.main_bucket.bucket
  policy = data.aws_iam_policy_document.policy_allow_public_access.json
}

data "aws_iam_policy_document" "policy_allow_public_access" {
  statement {
    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject",
    ]

    resources = [
      "${aws_s3_bucket.main_bucket.arn}/*",
    ]
  }
}

resource "aws_s3_object" "website_object" {
  bucket = aws_s3_bucket.main_bucket.bucket

  for_each     = module.website_files.files
  key          = each.key
  source       = each.value.source_path
  content_type = each.value.content_type
  etag         = each.value.digests.md5

  acl = "public-read"
}