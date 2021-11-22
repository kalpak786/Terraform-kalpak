##Launch configuration
resource "aws_launch_configuration" "this" {
  name                 = "${var.name}-lc"         #providing_values
  image_id             = var.image_id             #providing_values
  instance_type        = var.instance_type        #providing_values
  iam_instance_profile = var.iam_instance_profile #unsure
  key_name             = var.key_name             #providing_values

  security_groups             = var.security_groups             #providing_values
  associate_public_ip_address = var.associate_public_ip_address #sure
  user_data                   = var.user_data                   #sure 
  enable_monitoring           = var.enable_monitoring           #sure
  ebs_optimized               = var.ebs_optimized               #sure
  root_block_device {
    volume_type = var.volume_type
    volume_size = var.volume_size
    encrypted   = var.encrypted

  }
  #ebs_block_device      = var.ebs_block_device#unsure
  spot_price        = var.spot_price        #unsure
  placement_tenancy = var.placement_tenancy #unsure


}



##Auto-scaling-group
resource "aws_autoscaling_group" "this" {
  name                      = "${var.name}-asg"
  max_size                  = var.max_size
  min_size                  = var.min_size
  health_check_grace_period = var.health_check_grace_period
  health_check_type         = var.health_check_type
  desired_capacity          = var.desired_capacity
  force_delete              = var.force_delete
  placement_group           = var.placement_group
  launch_configuration      = aws_launch_configuration.this.name
  vpc_zone_identifier       = var.vpc_zone_identifier
  target_group_arns         = var.target_group_arns
}