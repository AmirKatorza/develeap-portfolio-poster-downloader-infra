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

variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  type    = string
  default = "t3a.small"
}
