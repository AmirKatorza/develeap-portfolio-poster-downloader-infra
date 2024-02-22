# Providers
variable "region" {
  description = "region to apply in"
  type        = string
  default     = "us-east-1"
}

variable "owner_tag" {
  description = "Owner tag for all resources"
  type        = string
}

variable "bootcamp_tag" {
  description = "Bootcamp tag for all resources"
  type        = string
}

variable "expiration_date_tag" {
  description = "Expiration date tag for all resources"
  type        = string
}

# VPC
variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "num_subnets" {
  type    = number
  default = 2
}

variable "cidr_offset" {
  type    = number
  default = 8
}

variable "map_public_ip_on_launch" {
  type    = bool
  default = true
}

# EKS
variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "node_group_name" {
  description = "Name of the EKS node group"
  type        = string
}

variable "node_group_desired_size" {
  description = "The desired number of worker nodes for the EKS node group"
  type        = number
  default     = 2
}

variable "node_group_max_size" {
  description = "The maximum number of worker nodes for the EKS node group"
  type        = number
  default     = 3
}

variable "node_group_min_size" {
  description = "The minimum number of worker nodes for the EKS node group"
  type        = number
  default     = 1
}

variable "node_group_max_unavailable" {
  description = "The maximum number of nodes that can be unavailable during a node group update"
  type        = number
  default     = 1
}

variable "node_group_instance_type" {
  description = "Type of the EC2 instance for the EKS node group"
  type        = string
  default     = "t3a.medium"
}

variable "node_group_ami_type" {
  type        = string
  default     = "AL2_x86_64"
  description = "AMI associated with the EKS node group"
}
variable "node_group_disk_size" {
  type        = number
  default     = 20
  description = "Disk size in GiB for worker nodes"
}

# ArgoCD
variable "gitops_github_repo_url" {
  description = "URL of the Git repository for ArgoCD access"
  type        = string
}

variable "argocd_values_file" {
  description = "Path to the ArgoCD values file"
  type        = string
}

variable "deploy_cluster_resource" {
  description = "A flag to determine whether the cluster resources should be deployed"
  type        = bool
  default     = false
}

variable "bootstrap_manifest_file" {
  description = "Path to the bootstrap-manifest.yaml file"
  type        = string
}