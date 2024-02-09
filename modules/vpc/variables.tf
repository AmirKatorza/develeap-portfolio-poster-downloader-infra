variable "vpc_name" {
  type    = string
  default = "tf-main-vpc"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "num_subnets" {
  type    = number
  default = 2
}

variable "cidr_offset" {
  type    = number
  default = 8
}

variable "map_public_ip_on_launch" {
  type    = bool
  default = true
}

variable "cluster_name" {
  type    = string
  default = "tf-eks-cluster"
}