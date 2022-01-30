/*
Prometheus installation
*/

data "local_file" "values" {
    filename = "${path.module}/values.yaml"
}

resource "kubernetes_namespace" "prometheus" {
  metadata {
    name = "prometheus"
  }

}

resource "helm_release" "prometheus_release" {
  name       = "prometheus"
  repository = var.prometheus_helm_url
  //version = var.prometheus_helm_version
  chart      = "prometheus"
  namespace = "prometheus"
  wait = false

  values = [
    data.local_file.values.content
  ]

  depends_on = [kubernetes_namespace.prometheus]
}