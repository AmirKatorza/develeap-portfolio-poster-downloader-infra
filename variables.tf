variable "single_target" {
  description = "Determines if only a single target is used"
  type        = bool
  default     = false
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_a_cidr" {
  description = "CIDR block for Subnet A"
  type        = string
  default     = "10.0.0.0/28"
}

variable "subnet_b_cidr" {
  description = "CIDR block for Subnet B"
  type        = string
  default     = "10.0.1.0/28"
}

variable "subnet_a_az" {
  description = "Availability Zone for Subnet A"
  type        = string
  default     = "us-east-1a"
}

variable "subnet_b_az" {
  description = "Availability Zone for Subnet B"
  type        = string
  default     = "us-east-1b"
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "subnet_a_name" {
  description = "Name of Subnet A"
  type        = string
}

variable "subnet_b_name" {
  description = "Name of Subnet B"
  type        = string
}

variable "instance_type" {
  description = "Type of the EC2 instance"
  type        = string
  default     = "t3.micro"
}

variable "associate_public_ip_address" {
  description = "Determines if the instance should have a public IP address"
  type        = bool
  default     = true
}

variable "key_name" {
  description = "Name of the key pair used for the instance"
  type        = string
  default     = "amirk-ssh"
}

variable "node_a_name" {
  description = "Name of Node A"
  type        = string
}

variable "node_b_name" {
  description = "Name of Node B"
  type        = string
}

variable "load_balancer_name" {
  description = "Name of the Load Balancer"
  type        = string
}

variable "lb_port" {
  description = "Port of the Load Balancer"
  type        = string
  default     = "80"
}

variable "lb_protocol" {
  description = "Protocol of the Load Balancer"
  type        = string
  default     = "HTTP"
}