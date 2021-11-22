resource "aws_lb_target_group" "this" {
  name                 = "${var.name}-tg"
  port                 = var.port
  protocol             = var.protocol
  vpc_id               = var.vpc_id
  deregistration_delay = var.deregistration_delay
  health_check {
    enabled           = "true"
    healthy_threshold = "3"
    interval          = "90"
    path              = var.healthcheck_path
    port              = var.healthcheck_port
    protocol          = var.healthcheck_protocol

  }
}

resource "aws_lb" "this" {
  name                       = "${var.name}-alb"
  internal                   = var.internal
  load_balancer_type         = "application"
  security_groups            = var.security_groups
  subnets                    = var.subnets
  enable_deletion_protection = false
  access_logs {
    bucket  = aws_s3_bucket.this.id
    prefix  = var.name
    enabled = false
  }
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.this.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}



resource "aws_s3_bucket" "this" {
  bucket = "${var.name}-logs-blk"
  acl    = "private"
}