output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_1a_id" {
  description = "The ID of the Subnet A"
  value       = module.vpc.public_subnet_1a_id
}

output "public_subnet_1b_id" {
  description = "The ID of Subnet B"
  value       = module.vpc.public_subnet_1b_id
}

output "eks_cluster_name" {
  description = "The NAME of the EKS Cluster"
  value       = module.eks.cluster_name
}

output "eks_cluster_id" {
  description = "The ID of the EKS Cluster"
  value       = module.eks.cluster_id
}

output "eks_node_group_role_arn" {
  description = "The ARN of the IAM Role for the EKS Node Group"
  value       = module.eks.node_group_role_arn
}

output "test_policy_arn" {
  description = "The ARN of the test policy associated with the EKS cluster"
  value       = module.eks.test_policy_arn
}