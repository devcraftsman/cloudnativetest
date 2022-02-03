/*
argocd installation
*/


data "local_file" "values" {
    filename = "${path.module}/values.yaml"
}

resource "kubernetes_namespace" "argocd" {
  metadata {
    name = var.argocd_ns
  }

}

resource "helm_release" "argocd_release" {
  name       = "argo-cd"
  repository = var.argocd_helm_url
  // version = var.argocd_helm_version
  chart      = "argo-cd"
  namespace = var.argocd_ns
  wait = false

  values = [
    data.local_file.values.content
  ]

  depends_on = [kubernetes_namespace.argocd]
}