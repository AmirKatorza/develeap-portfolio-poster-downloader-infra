resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "5.53.14" # Use the appropriate version

  namespace = "argocd"
  create_namespace = true
  wait             = true

  set {
    name  = "server.service.type"
    value = "LoadBalancer"
  } 
}
