# Retrieve GitHub SSH Key from AWS Secrets Manager
data "aws_secretsmanager_secret" "github_ssh_key" {
  arn = "arn:aws:secretsmanager:us-east-1:644435390668:secret:amirk-argo-ssh-xCsl8I"
}

data "aws_secretsmanager_secret_version" "github_ssh_key_current" {
  secret_id = data.aws_secretsmanager_secret.github_ssh_key.id
}

resource "kubernetes_secret" "argocd_github_ssh_key" {
  depends_on = [helm_release.argocd]

  metadata {
    name      = "argocd-github-ssh-key"
    namespace = "argocd"
    labels = {
      "argocd.argoproj.io/secret-type" = "repository"
    }
  }

  data = {
    url           = var.gitops_github_repo_url
    type          = "git"
    sshPrivateKey = data.aws_secretsmanager_secret_version.github_ssh_key_current.secret_string    
  }
}