# Retrieve GitHub SSH Key from AWS Secrets Manager
data "aws_secretsmanager_secret" "github_ssh_key" {
  arn = "arn:aws:secretsmanager:us-east-1:644435390668:secret:amirk-github-ssh-7CREA4"
}

data "aws_secretsmanager_secret_version" "github_ssh_key_current" {
  secret_id = data.aws_secretsmanager_secret.github_ssh_key.id
}

# Create Kubernetes Secret for ArgoCD Repo Access
resource "kubernetes_secret" "github_ssh_key" {
  depends_on = [helm_release.argocd]

  metadata {
    name      = "github-ssh-key"
    namespace = "argocd"
    labels = {
      "argocd.argoproj.io/secret-type" = "repository"
    }
  }

  data = {
    "name"          = "develeap-portfolio-poster-downloader-gitops" # Name for the repository credential within ArgoCD
    "type"          = "git" # Type of the repository
    "url"           = "git@github.com:AmirKatorza/develeap-portfolio-poster-downloader-gitops.git" # Repository URL    
    "sshPrivateKey" = data.aws_secretsmanager_secret_version.github_ssh_key_current.secret_string
  }
}
