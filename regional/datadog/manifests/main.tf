# Kubernetes Datadog Operator Module (osinfra.io)
# https://github.com/osinfra-io/terraform-kubernetes-datadog-operator

module "kubernetes_datadog_operator_manifests" {
  source = "github.com/osinfra-io/terraform-kubernetes-datadog-operator//regional/manifests?ref=v0.1.6"

  api_key        = var.datadog_api_key
  app_key        = var.datadog_app_key
  cluster_prefix = "plt"
  registry       = "us-docker.pkg.dev/plt-lz-services-tf79-prod/plt-docker-virtual"
  team           = "platform-google-cloud-kubernetes"
}
