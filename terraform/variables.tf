variable "aws_credential" {
  type = object({
    AWS_ACCESS_KEY_ID     = string
    AWS_SECRET_ACCESS_KEY = string
  })
  sensitive = true
}

variable "bucket_name" {
  type = string
}