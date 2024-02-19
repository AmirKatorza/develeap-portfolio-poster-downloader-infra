# Install ArgoCD to the cluster
resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "5.52.1"

  namespace        = "argocd"
  create_namespace = true
  wait             = true

  values = [
    "${file(var.argocd_values_file)}"
  ]
}

# Apply the ArgoCD bootstrap application manifest
resource "kubectl_manifest" "bootstrap_cluster" {
  depends_on = [
    helm_release.argocd,
    kubernetes_secret.argocd_github_ssh_key,
    kubernetes_secret.mongodb_cred_secret
  ]
  count     = var.deploy_cluster_resource ? 1 : 0
  yaml_body = file(var.bootstrap_manifest_file)
}
