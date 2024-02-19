variable "argocd_values_file" {
  description = "Path to the ArgoCD values.yaml file"
  type        = string
}

variable "gitops_github_repo_url" {
  description = "URL of the Git repository for ArgoCD access"
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