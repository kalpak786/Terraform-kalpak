resource "aws_instance" "Web" {
  ami           = "ami-0e0bf4b3a0c0e0adc"
  instance_type = "t2.micro"
  tags = {
    Name = "Web"
  }
}

resource "aws_ebs_volume" "example1" {
  availability_zone = "us-west-1b"
  size              = 40
  tags = {
    Name = "newvol"
  }
}

resource "aws_instance" "web" {
  ami               = "ami-0e0bf4b3a0c0e0adc"
  availability_zone = "us-west-1b"
  instance_type     = "t2.micro"

  tags = {
    Name = "Hello"
  }
}


resource "aws_ebs_volume" "example" {
  availability_zone = "us-west-1b"
  size              = 20
  tags = {
    Name = "demovol"
  }
}
resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.example.id
  instance_id = aws_instance.web.id
}

resource "aws_iam_group_membership" "team" {
  name = "tf-testing-group-membership"

  users = [
    aws_iam_user.user_one.name,
    aws_iam_user.user_two.name,
    aws_iam_user.user_three.name,
  ]

  group = aws_iam_group.Trainer.name
}


resource "aws_iam_user" "user_one" {
  name = "Harry"
}

resource "aws_iam_user" "user_two" {
  name = "Sam"
}

resource "aws_iam_user" "user_three" {
  name = "Tom"
}

resource "aws_iam_group" "Trainer" {
  name = "Trainer"
  #path = "/users/"
}

resource "aws_instance" "Web" {
  ami           = "ami-0e0bf4b3a0c0e0adc"
  instance_type = "t2.micro"
  tags = {
    Name = "Web"
  }
}

resource "aws_eip" "lb" {
  instance = aws_instance.Web.id
  vpc      = true
}
