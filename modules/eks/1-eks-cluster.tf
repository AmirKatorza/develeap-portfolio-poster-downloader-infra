resource "aws_eks_cluster" "my_cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_policy_attachment
  ]
}

resource "aws_eks_addon" "aws-ebs-csi-driver" {
  cluster_name = aws_eks_cluster.my_cluster.name
  addon_name   = "aws-ebs-csi-driver"

  depends_on = [aws_eks_node_group.my_node_group]
}

resource "aws_eks_addon" "kube-proxy" {
  cluster_name = aws_eks_cluster.my_cluster.name
  addon_name   = "kube-proxy"

  depends_on = [aws_eks_node_group.my_node_group]
}

resource "aws_eks_addon" "coredns" {
  cluster_name = aws_eks_cluster.my_cluster.name
  addon_name   = "coredns"

  depends_on = [aws_eks_node_group.my_node_group]
}

resource "aws_eks_addon" "vpc-cni" {
  cluster_name = aws_eks_cluster.my_cluster.name
  addon_name   = "vpc-cni"

  depends_on = [aws_eks_node_group.my_node_group]
}
