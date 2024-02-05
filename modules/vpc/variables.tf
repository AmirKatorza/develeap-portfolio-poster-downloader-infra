variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "vpc_name" {
  type    = string
  default = "tf-main-vpc"
}

variable "subnet_1a_name" {
  type    = string
  default = "public-subnet-1a"
}

variable "subnet_1a_cidr" {
  type    = string
  default = "10.0.0.0/28"
}

variable "subnet_1a_az" {
  type    = string
  default = "us-east-1a"
}

variable "subnet_1b_name" {
  type    = string
  default = "public-subnet-1b"
}

variable "subnet_1b_cidr" {
  type    = string
  default = "10.0.1.0/28"
}

variable "subnet_1b_az" {
  type    = string
  default = "us-east-1b"
}

variable "single_target" {
  type    = bool
  default = false
}

variable "cluster_name" {
  type    = string
  default = "tf-eks-cluster"
}