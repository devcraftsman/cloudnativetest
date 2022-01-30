variable "nginx_helm_url" {
  default = "https://kubernetes.github.io/ingress-nginx"
}

variable "nginx_helm_version" {
  default = "latest"
}

variable "wait_timeout" {
  default = 300
  type = number
  description = "Wait timout for items to be completed"
}