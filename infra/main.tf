terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.7.1"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.4.1"
    }

    local = {
      source  = "hashicorp/local"
      version = "~> 2.1.0"
    }

    http = {
      source  = "hashicorp/http"
      version = "~> 2.1.0"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}


module "dashboard" {
  source = "./modules/dashboard"
}

module "nginx-ingress" {
  source = "./modules/nginx-ingress"
}

module "prometheus" {
  source = "./modules/prometheus"

  depends_on = [
    module.nginx-ingress
  ]
}

module "istio" {
  source = "./modules/istio"
}


module "argocdn" {
  source = "./modules/argo"

  depends_on = [
    module.nginx-ingress
  ]
}
