variable "argocd_helm_url" {
  default = "https://argoproj.github.io/argo-helm"
}

variable "argocd_helm_version" {
  default = "latest"
}

variable "argocd_ns" {
  default = "argocd"
  description = "the namespace for argocd installation"
}