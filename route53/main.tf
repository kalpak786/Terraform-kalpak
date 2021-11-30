# created route53

provider "aws" {
  region  = "us-west-1"
}

resource "aws_route53_zone" "dev" {
  for_each = toset(var.name )
  name = "${each.key}.domain.com"
  
  vpc {
    vpc_id = var.vpc_id
  }
}

  

