variable "ingress_wait_time" {
  default = "30s"
  description = "Sleep time to wait ingress to be running up before continue. This avoid errors with helm provided elements like argo and prometheus"
}
