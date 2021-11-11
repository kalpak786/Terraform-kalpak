resource "aws_instance" "this" {
  ami           = "ami-0f19d220602031aed"
  instance_type = "t2.micro"
  tags = {
    Name = "Web Server Test"
  }
}