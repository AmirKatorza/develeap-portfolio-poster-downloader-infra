output "cluster_name" {
  value = aws_eks_cluster.my_cluster.name
}

output "cluster_id" {
  value = aws_eks_cluster.my_cluster.id
}

output "cluster_arn" {
  value = aws_eks_cluster.my_cluster.arn
}

output "node_group_role_arn" {
  value = aws_iam_role.eks_node_role.arn
}

output "cluster_endpoint" {
  value = aws_eks_cluster.my_cluster.endpoint
}

output "cluster_certificate_authority_data" {
  value = aws_eks_cluster.my_cluster.certificate_authority[0].data
}

output "cluster_token" {
  value = data.aws_eks_cluster_auth.my_cluster.token
}