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

variable "node_group_desired_size" {
  description = "The desired number of worker nodes for the EKS node group"
  type        = number
  default     = 2
}

variable "node_group_max_size" {
  description = "The maximum number of worker nodes for the EKS node group"
  type        = number
  default     = 3
}

variable "node_group_min_size" {
  description = "The minimum number of worker nodes for the EKS node group"
  type        = number
  default     = 1
}

variable "node_group_max_unavailable" {
  description = "The maximum number of nodes that can be unavailable during a node group update"
  type        = number
  default     = 1
}

variable "node_group_instance_type" {
  description = "Type of the EC2 instance for the EKS node group"
  type        = string
  default     = "t3a.medium"
}

variable "node_group_ami_type" {
  type        = string
  default     = "AL2_x86_64"
  description = "AMI associated with the EKS node group"
}
variable "node_group_disk_size" {
  type        = number
  default     = 20
  description = "Disk size in GiB for worker nodes"
}

# argocd
variable "argocd_values_file" {
  description = "Path to the ArgoCD values file"
  type        = string
}