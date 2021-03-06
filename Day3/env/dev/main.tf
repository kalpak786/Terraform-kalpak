provider "aws" {
  region = "us-west-1"
}


module "auto_scaling" {
  source              = "../../modules/auto_scaling/"
  name                = "sample"
  image_id            = "ami-0074ef78ecb07948c"
  instance_type       = "t2.micro"
  key_name            = "n-califor"
  security_groups     = ["sg-00e4ac45cb676a740"]
  volume_size         = "80"
  max_size            = "3"
  min_size            = "2"
  desired_capacity    = "2"
  vpc_zone_identifier = ["subnet-02f29c03103206353", "subnet-0b30491118eb0da7c"]
  target_group_arns   = [module.alb.tg]
}


module "alb" {
  source          = "../../modules/alb"
  name            = "sample"
  vpc_id          = "vpc-076f819e3cd1507d0"
  security_groups = ["sg-00e4ac45cb676a740"]
  subnets         = ["subnet-02f29c03103206353", "subnet-0b30491118eb0da7c"]
}


# output "tg_arn" {
#     value = module.alb  
# }