module "vpc" {
  source = "./modules/vpc"

  vpc_name                = var.vpc_name
  vpc_cidr                = var.vpc_cidr
  num_subnets             = var.num_subnets
  cidr_offset             = var.cidr_offset
  map_public_ip_on_launch = var.map_public_ip_on_launch
  cluster_name            = var.cluster_name
}

module "eks" {
  source     = "./modules/eks"
  depends_on = [module.vpc]

  cluster_name               = var.cluster_name
  subnet_ids                 = module.vpc.public_subnet_ids
  node_group_name            = var.node_group_name
  node_group_desired_size    = var.node_group_desired_size
  node_group_max_size        = var.node_group_max_size
  node_group_min_size        = var.node_group_min_size
  node_group_max_unavailable = var.node_group_max_unavailable
  node_group_instance_type   = var.node_group_instance_type
  node_group_disk_size       = var.node_group_disk_size
  node_group_ami_type        = var.node_group_ami_type
}

module "argocd" {
  source     = "./modules/argocd"
  depends_on = [module.eks]

  gitops_github_repo_url = var.gitops_github_repo_url
  argocd_values_file = var.argocd_values_file
}