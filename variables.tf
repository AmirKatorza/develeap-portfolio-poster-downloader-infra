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

variable "subnet_1a_name" {
  description = "Name of Subnet A"
  type        = string
}

variable "subnet_1a_cidr" {
  description = "CIDR block for Subnet A"
  type        = string
  default     = "10.0.1.0/28"
}

variable "subnet_1a_az" {
  description = "Availability Zone for Subnet A"
  type        = string
  default     = "us-east-1a"
}

variable "subnet_1b_name" {
  description = "Name of Subnet B"
  type        = string
}

variable "subnet_1b_cidr" {
  description = "CIDR block for Subnet B"
  type        = string
  default     = "10.0.2.0/28"
}

variable "subnet_1b_az" {
  description = "Availability Zone for Subnet B"
  type        = string
  default     = "us-east-1b"
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