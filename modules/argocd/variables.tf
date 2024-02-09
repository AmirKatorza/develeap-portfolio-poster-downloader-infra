variable "eks_cluster_name" {
  type        = string
  description = "The name of the EKS cluster"
}

# Or if using the ARN is more appropriate for your setup
variable "eks_cluster_arn" {
  type        = string
  description = "The ARN of the EKS cluster"
}