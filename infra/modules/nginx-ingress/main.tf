/*
Nginx-ingress installation
*/

data "local_file" "values" {
    filename = "${path.module}/values.yaml"
}


resource "kubernetes_namespace" "ingress-nginx" {
  metadata {
    name = "ingress-nginx"
  }

}

resource "helm_release" "ingress_nginx" {
  name       = "ingress-nginx"
  repository = var.nginx_helm_url
  // version = var.istio_helm_version
  chart      = "ingress-nginx"
  namespace = "ingress-nginx"
  wait = true
  timeout = var.wait_timeout

  values = [
    data.local_file.values.content
  ]

  depends_on = [kubernetes_namespace.ingress-nginx, kubernetes_manifest.ingressclass_nginx]
}


