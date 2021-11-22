##Launch configuration

variable "name" {
  type = string
}
variable "image_id" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "iam_instance_profile" {
  type    = string
  default = null
}
variable "key_name" {
  type = string
}


variable "security_groups" {
  type = list(string)
}
variable "associate_public_ip_address" {
  type    = bool
  default = false
}
variable "user_data" {
  type    = string
  default = null
}
variable "enable_monitoring" {
  type    = bool
  default = true
}
variable "ebs_optimized" {
  type    = bool
  default = false
}

variable "spot_price" {
  type    = string
  default = null
}
variable "placement_tenancy" {
  type    = string
  default = null
}
variable "volume_type" {
  type    = string
  default = "gp2"
}
variable "volume_size" {
  type    = string
  default = "50"
}
variable "encrypted" {
  type    = bool
  default = true
}

###Auto-scaling group setting

variable "max_size" {
  type = string

}
variable "min_size" {
  type = string

}
variable "health_check_grace_period" {
  type    = string
  default = "300"

}
variable "health_check_type" {
  type    = string
  default = "ELB"
}
variable "desired_capacity" {
  type = string

}
variable "force_delete" {
  type    = bool
  default = true
}
variable "placement_group" {
  type    = string
  default = null

}

variable "vpc_zone_identifier" {
  type    = list(string)
  default = null
}
variable "target_group_arns" {
  type    = list(string)
  default = []
}



 