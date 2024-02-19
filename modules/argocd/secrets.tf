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
    name          = "gitops"
    url           = var.gitops_github_repo_url
    type          = "git"
    sshPrivateKey = data.aws_secretsmanager_secret_version.github_ssh_key_current.secret_string
  }
}

# Poster-Downloader MongoDB Credentials

data "aws_secretsmanager_secret" "mongodb-credentials" {
  arn = "arn:aws:secretsmanager:us-east-1:644435390668:secret:amirk-mongodb-B6iDu9"
}

data "aws_secretsmanager_secret_version" "mongodb-credentials_current" {
  secret_id = data.aws_secretsmanager_secret.mongodb-credentials.id
}

resource "kubernetes_namespace" "poster-downloader" {
  metadata {
    name = "poster-downloader"
  }
}

resource "kubernetes_secret" "mongodb_cred_secret" {
  depends_on = [kubernetes_namespace.poster-downloader]

  metadata {
    name      = "mongodb-credentials"
    namespace = "poster-downloader"
  }

  data = {
    mongodb-passwords        = jsondecode(data.aws_secretsmanager_secret_version.mongodb-credentials_current.secret_string)["mongodb-passwords"][0]
    mongodb-root-password    = jsondecode(data.aws_secretsmanager_secret_version.mongodb-credentials_current.secret_string)["mongodb-root-password"]
    mongodb-metrics-password = ""
    mongodb-replica-set-key  = jsondecode(data.aws_secretsmanager_secret_version.mongodb-credentials_current.secret_string)["mongodb-replica-set-key"]
  }
}