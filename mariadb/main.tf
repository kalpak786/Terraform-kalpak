provider "aws" {
  region  = "us-west-1"
}

resource "aws_db_instance" "this" {
  count               = 2
  allocated_storage   = 50
  storage_type        = "gp2"
  engine              = "mariadb"
  engine_version      = "10.2.32"
  instance_class      = "db.t2.micro"
  name                = "mydb"
  username            = "root"
  password            = "root123"
  skip_final_snapshot = true
  


}

