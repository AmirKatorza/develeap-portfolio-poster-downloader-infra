variable "argocd_values_file" {
  description = "Path to the ArgoCD values.yaml file"
  type        = string
}

variable "gitops_github_repo_url" {
  description = "URL of the Git repository for ArgoCD access"
  type        = string  
}