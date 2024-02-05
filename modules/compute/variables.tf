variable "ami" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t3a.small"
}

variable "associate_public_ip_address" {
  type    = bool
  default = true
}

variable "node_a_name" {
  type    = string
  default = "node_a"
}

variable "subnet_a_id" {
  type = string
}

variable "node_b_name" {
  type    = string
  default = "node_b"
}

variable "subnet_b_id" {
  type = string
}

variable "single_target" {
  type    = bool
  default = false
}

variable "key_name" {
  type    = string
  default = "amirk-ssh"
}

variable "target_group_name" {
  type    = string
  default = "web-tg"
}

variable "lb_port" {
  type    = string
  default = "80"
}

variable "lb_protocol" {
  type    = string
  default = "HTTP"
}

variable "load_balancer_name" {
  type    = string
  default = "web-lb"
}

variable "sg_name" {
  type    = string
  default = "web-access-sg"
}

variable "sg_description" {
  type    = string
  default = "web access security group"
}

variable "vpc_id" {
  type = string
}

variable "ssh_cidr_blocks" {
  type    = list(any)
  default = ["147.235.205.129/32"]
}

variable "http_cidr_blocks" {
  type    = list(any)
  default = ["0.0.0.0/0"]
}

variable "https_cidr_blocks" {
  type    = list(any)
  default = ["0.0.0.0/0"]
}