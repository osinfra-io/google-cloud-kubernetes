# Kubernetes Datadog Operator Module (osinfra.io)
# https://github.com/osinfra-io/terraform-kubernetes-datadog-operator

module "kubernetes_datadog_operator" {
  source = "github.com/osinfra-io/terraform-kubernetes-datadog-operator//regional?ref=v0.1.9"

  api_key        = var.datadog_api_key
  app_key        = var.datadog_app_key
  cluster_prefix = "plt"
}
