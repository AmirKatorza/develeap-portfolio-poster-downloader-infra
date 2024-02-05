module "vpc" {
  source        = "./modules/vpc"
  single_target = var.single_target
  vpc_cidr      = var.vpc_cidr
  subnet_a_cidr = var.subnet_a_cidr
  subnet_b_cidr = var.single_target ? null : var.subnet_b_cidr
  subnet_a_az   = var.subnet_a_az
  subnet_b_az   = var.single_target ? null : var.subnet_b_az
  vpc_name      = var.vpc_name
  subnet_a_name = var.subnet_a_name
  subnet_b_name = var.single_target ? null : var.subnet_b_name
}

# module "compute" {
#   source                      = "./modules/compute"
#   depends_on                  = [module.network]
#   ami                         = data.aws_ami.server_ami_debian.id
#   single_target               = var.single_target
#   instance_type               = var.instance_type
#   associate_public_ip_address = var.associate_public_ip_address
#   key_name                    = var.key_name
#   node_a_name                 = var.node_a_name
#   node_b_name                 = var.single_target ? null : var.node_b_name
#   load_balancer_name          = var.load_balancer_name
#   lb_port                     = var.lb_port
#   lb_protocol                 = var.lb_protocol
#   vpc_id                      = module.network.vpc_id
#   subnet_a_id                 = module.network.subnet_a_id
#   subnet_b_id                 = var.single_target ? null : module.network.subnet_b_id
# }