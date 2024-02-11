variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
  default     = "portfolio-cluster"
}

variable "subnet_ids" {
  description = "A list of subnet IDs to launch the cluster in"
  type        = list(string)
}

# Node group variables
variable "node_group_name" {
  description = "The name of the EKS node group"
  type        = string
  default     = "portfolio-nodegroup"
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
  description = "Instance type for the EKS node group"
  type        = string
  default     = "t3a.medium"  
}

variable "node_group_ami_type" {
  description = "AMI associated with the EKS node group"
  type        = string
  default     = "AL2_x86_64"  
}
variable "node_group_disk_size" {
  description = "Disk size in GiB for worker nodes"
  type        = number
  default     = 20  
}