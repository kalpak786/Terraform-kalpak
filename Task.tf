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



# resource "aws_vpc" "main" {
#   cidr_block       = "10.0.0.0/16"
#   instance_tenancy = "default"

#   tags = {
#     Name = "main"
#   }
# }

# resource "aws_internet_gateway" "gw" {
#   vpc_id = aws_vpc.main.id

#   tags = {
#     Name = "main"
#   }
# }


# resource "aws_subnet" "main" {
#   vpc_id     = aws_vpc.main.id
#   cidr_block = "10.0.1.0/24"

#   tags = {
#     Name = "Main"
#   }
# }



# resource "aws_instance" "foo" {
#   # us-west-2
#   ami           = "ami-0e0bf4b3a0c0e0adc"
#   instance_type = "t2.micro"

#   private_ip = "10.0.1.12"
#   subnet_id  = aws_subnet.main.id
# }

# resource "aws_eip" "bar" {
#   vpc = true

#   instance                  = aws_instance.foo.id
#   associate_with_private_ip = "10.0.1.12"
#   depends_on                = [aws_internet_gateway.gw]
# }


# resource "aws_eip" "bar1" {
#   vpc = true

#   instance                  = aws_instance.foo.id
#   associate_with_private_ip = "10.0.1.22"
#   depends_on                = [aws_internet_gateway.gw]
# }
