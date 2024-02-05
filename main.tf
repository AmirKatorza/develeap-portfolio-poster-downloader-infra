module "vpc" {
  source        = "./modules/vpc"  
  vpc_name      = var.vpc_name
  vpc_cidr      = var.vpc_cidr
  subnet_1a_name = var.subnet_a_name
  subnet_1a_cidr = var.subnet_1a_cidr
  subnet_1a_az   = var.subnet_1a_az
  subnet_1b_name = var.subnet_b_name  
  subnet_1b_cidr = var.subnet_1b_cidr  
  subnet_1b_az   = var.subnet_1b_az
  cluster_name  = var.cluster_name
}

module "eks" {
  source = "./modules/eks"  
  cluster_name = var.cluster_name
  subnet_ids = [module.vpc.public_subnet_1a_id, module.vpc.public_subnet_1b_id]
  node_group_name = var.node_group_name
  node_group_desired_capacity = var.node_group_desired_capacity
  node_group_max_capacity = var.node_group_max_capacity
  node_group_min_capacity = var.node_group_min_capacity
  node_group_instance_type = var.node_group_instance_type
  node_group_volume_size = var.node_group_volume_size
  node_group_key_name = var.node_group_key_name
  node_group_public_access_cidrs = var.node_group_public_access_cidrs
  node_group_subnets = var.single_target ? [module.vpc.subnet_a_id] : [module.vpc.subnet_a_id, module.vpc.subnet_b_id]
  node_group_security_group_ids = [module.vpc.eks_security_group_id]
  node_group_ami_id = data.aws_ami.eks_ami.id
  node_group_tags = var.node_group_tags
  node_group_labels = var.node_group_labels
  node_group_taints = var.node_group_taints
  node_group_additional_tags = var.node_group_additional_tags
  node_group_kubelet_extra_args = var.node_group_kubelet
}