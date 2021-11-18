##target_group
variable "name" {
    type = string

}
variable "port" {
    type = string
    default = 80
}
variable "protocol" {
    type = string
    default = "HTTP"

}
variable "vpc_id" {
    type = string

}
variable "deregistration_delay" {
    type = string
    default = null
}
variable "healthcheck_path" {
    type = string
    default = "/"

}
variable "healthcheck_port" {
    type = number
    default = "80"  

}
variable "healthcheck_protocol" {
    type = string
    default = "HTTP"
}


##application_loadbalancer
variable "internal" {
    type = bool
    default = false

}
variable "security_groups" {
    type = list(string)

}
variable "subnets" {
    type = list(string) 
}

