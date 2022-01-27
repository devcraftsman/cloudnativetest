/*
Istio installation
*/


resource "kubernetes_namespace" "istio_system" {
  metadata {
    name = "istio-system"
  }

}

resource "helm_release" "istio_base_release" {
  name       = "istio-base"
  repository = var.istio_helm_url
  // version = var.istio_helm_version
  chart      = "base"
  namespace = "istio-system"
  wait = false

  depends_on = [kubernetes_namespace.istio_system]
}


resource "helm_release" "istiod_release" {
  name       = "istiod"
  repository = var.istio_helm_url
  // version = var.istio_helm_version
  chart      = "istiod"
  namespace = "istio-system"

  depends_on = [kubernetes_namespace.istio_system,helm_release.istio_base_release]
}

### Ingress Gateway ###

resource "kubernetes_namespace" "istio-ingress" {
  metadata {
    name = "istio-ingress"

    labels = {
    "istio-injection" = "enabled"
    }
  }
}

resource "helm_release" "istio_gateway_release" {
  name       = "istio-ingress"
  repository = var.istio_helm_url
  // version = var.istio_helm_version
  chart      = "gateway"
  namespace = "istio-ingress"
  wait = false

  depends_on = [kubernetes_namespace.istio-ingress,helm_release.istio_base_release]
}