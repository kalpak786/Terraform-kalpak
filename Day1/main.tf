resource "aws_instance" "Web" {
  ami           = "ami-0e0bf4b3a0c0e0adc"
  instance_type = "t2.micro"
  tags = {
    Name = "Web"
  }
}