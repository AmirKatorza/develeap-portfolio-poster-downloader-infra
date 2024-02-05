variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
  default     = "portfolio-cluster"
}

variable "subnet_ids" {
  description = "A list of subnet IDs to launch the cluster in"
  type        = list(string)
}

variable "node_group_name" {
  description = "The name of the EKS node group"
  type        = string
  default     = "portfolio-nodegroup"
}

variable "node_group_instance_type" {
  type    = string
  default = "t3a.small"
}
