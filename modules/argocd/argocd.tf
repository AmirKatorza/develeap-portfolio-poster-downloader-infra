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

# # Apply the ArgoCD bootstrap application manifest
# resource "kubernetes_manifest" "argocd_application" {
#   depends_on = [helm_release.argocd, kubernetes_secret.github_ssh_key]
#   manifest = yamldecode(file("${path.module}/application.yaml"))
# }