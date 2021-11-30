provider "aws" {
  region  = "us-east-2"
  profile = "default"
}
resource "aws_instance" "this" {
  count         = length(var.subnet_id)
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id[count.index]
  tags = {
    Name = "terra-ec2"
  }
}
resource "aws_ebs_volume" "vol" {
  count             = length(var.subnet_id)
  availability_zone = aws_instance.this[count.index].availability_zone
  size              = 1
  tags = {
    Name = "Extra_EBS"
  }
}
resource "aws_ebs_volume" "vol1" {
  count             = length(var.subnet_id)
  availability_zone = aws_instance.this[count.index].availability_zone
  size              = 1
  tags = {
    Name = "Extra_EBS1"
  }
}

resource "aws_volume_attachment" "attach" {
  count       = length(var.subnet_id)
  device_name = "/dev/xvdb"
  volume_id   = aws_ebs_volume.vol[count.index].id
  instance_id = aws_instance.this[count.index].id
  depends_on  = [aws_instance.this]
}
resource "aws_volume_attachment" "attach1" {
  count       = length(var.subnet_id)
  device_name = "/dev/xvdc"
  volume_id   = aws_ebs_volume.vol1[count.index].id
  instance_id = aws_instance.this[count.index].id
  depends_on  = [aws_instance.this]
}