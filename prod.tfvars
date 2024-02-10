# VPC
vpc_name                = "amirk-tf-vpc-portfolio"
num_subnets             = 2
cidr_offset             = 8
map_public_ip_on_launch = true

# EKS
cluster_name               = "amirk-tf-eks-portfolio"
node_group_name            = "amirk-tf-eks-node-group-portfolio"
node_group_desired_size    = 3
node_group_max_size        = 3
node_group_min_size        = 3
node_group_max_unavailable = 1

# ArgoCD
argocd_values_file = "modules/argocd/argocd-values.yaml"