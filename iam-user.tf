resource "aws_iam_user" "dem" {
  count = 10
  name  = "Kalpak.${count.index}"
}