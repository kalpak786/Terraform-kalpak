# route 53 private zone

provider "aws" {
  region  = "us-east-2"
  profile = "default"
}

resource "aws_route53_zone" "www" {
  for_each = toset(var.name )
  name = "${each.key}.domain.com"
  
  vpc {
    vpc_id = var.vpc_id
  }
}

  

