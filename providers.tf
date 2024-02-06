terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.0"
    }

    # Optional: If you need to run kubectl commands directly
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "~> 1.11.1"
    }
  }

  backend "s3" {
    bucket = "amirk-portfolio-tf-backend"
    key    = "full-Deployment/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region                   = "us-east-1"
  shared_config_files      = ["~/.aws/config"]
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = "amirk-develeap"

  default_tags {
    tags = {
      owner           = "amirk"
      bootcamp        = "19"
      expiration_date = "29-09-2024"
    }
  }
}

data "aws_eks_cluster" "my_cluster" {
  name = module.eks.cluster_name
}

data "aws_eks_cluster_auth" "my_cluster" {
  name = module.eks.cluster_name
}

provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
  token                  = data.aws_eks_cluster_auth.my_cluster.token
}

provider "helm" {
  kubernetes {
    host                   = module.eks.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
    token                  = data.aws_eks_cluster_auth.my_cluster.token
  }
}
