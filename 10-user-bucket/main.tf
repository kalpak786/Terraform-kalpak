# ceateed iam user with count function
provider "aws" {
  region  = "us-west-1"
}
resource "aws_iam_user" "this" {
  count = length(var.name)
  name  = var.name[count.index]
  path  = "/"

  tags = {
    tag-key = "user"
  }
}

resource "aws_s3_bucket" "this" {
  count  = length(var.s3_bucket_name)
  bucket = var.s3_bucket_name[count.index]
  acl    = "private"

  tags = {
    Name = "tasks"
  }
}
