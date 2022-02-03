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

    time = {
      source  = "hashicorp/time"
      version = "~> 0.7.2"
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

resource "time_sleep" "wait_ingress" {
  depends_on = [module.nginx-ingress]

  create_duration = var.ingress_wait_time
}


module "prometheus" {
  source = "./modules/prometheus"

  depends_on = [
    time_sleep.wait_ingress
  ]
}

module "istio" {
  source = "./modules/istio"
} 


module "argocd" {
  source = "./modules/argo"

  depends_on = [
    time_sleep.wait_ingress
  ]
}
