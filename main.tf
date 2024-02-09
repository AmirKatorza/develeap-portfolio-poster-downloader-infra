module "vpc" {
  source         = "./modules/vpc"
  vpc_name       = var.vpc_name
  vpc_cidr       = var.vpc_cidr
  subnet_1a_name = var.subnet_1a_name
  subnet_1a_cidr = var.subnet_1a_cidr
  subnet_1a_az   = var.subnet_1a_az
  subnet_1b_name = var.subnet_1b_name
  subnet_1b_cidr = var.subnet_1b_cidr
  subnet_1b_az   = var.subnet_1b_az
  cluster_name   = var.cluster_name
}

module "eks" {
  source                   = "./modules/eks"
  depends_on               = [module.vpc]
  cluster_name             = var.cluster_name
  subnet_ids               = module.vpc.public_subnet_ids
  node_group_name          = var.node_group_name
  node_group_instance_type = var.node_group_instance_type
}

module "argocd" {
  source = "./modules/argocd"  
  depends_on = [module.eks]
  eks_cluster_name = module.eks.cluster_name  
  eks_cluster_arn = module.eks.cluster_arn
}
