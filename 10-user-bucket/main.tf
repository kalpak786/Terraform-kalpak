# ceate iam user using count function
provider "aws" {
  region  = "us-west-2"
  profile = "default"
}
resource "aws_iam_user" "this" {
  count = length(var.name)
  name  = var.name[count.index]
  path  = "/"

  tags = {
    tag-key = "terra-user"
  }
}

resource "aws_s3_bucket" "this" {
  count  = length(var.s3_bucket_name)
  bucket = var.s3_bucket_name[count.index]
  acl    = "private"

  tags = {
    Name = "My bucket"
  }
}
