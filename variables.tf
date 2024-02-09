# vpc
variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
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

# eks
variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "node_group_name" {
  description = "Name of the EKS node group"
  type        = string
}

variable "node_group_instance_type" {
  description = "Type of the EC2 instance"
  type        = string
  default     = "t3a.small"
}