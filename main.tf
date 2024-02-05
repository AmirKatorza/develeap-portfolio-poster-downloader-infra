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
  cluster_name             = var.cluster_name
  subnet_ids               = [module.vpc.public_subnet_1a_id, module.vpc.public_subnet_1b_id]
  node_group_name          = var.node_group_name
  node_group_instance_type = var.node_group_instance_type
}