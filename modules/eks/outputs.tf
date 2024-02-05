output "cluster_id" {
  value = aws_eks_cluster.my_cluster.id
}

output "node_group_role_arn" {
  value = aws_iam_role.eks_node_role.arn
}
