# region
region = "us-east-1"

# tags
owner_tag       = "amirk"
bootcamp_tag    = "19"
expiration_date = "29-09-2024"

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
argocd_values_file      = "modules/argocd/argocd-values.yaml"
gitops_github_repo_url  = "git@github.com:AmirKatorza/develeap-portfolio-poster-downloader-gitops.git"
deploy_cluster_resource = false
bootstrap_manifest_file = "modules/argocd/bootstrap-manifest.yaml"