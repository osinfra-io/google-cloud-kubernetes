# Kubernetes Istio Module (osinfra.io)
# https://github.com/osinfra-io/terraform-kubernetes-istio

module "kubernetes_istio_manifests" {
  source = "github.com/osinfra-io/terraform-kubernetes-istio//regional/manifests?ref=v0.1.7"

  common_istio_test_virtual_services = var.kubernetes_istio_common_istio_test_virtual_services
  common_virtual_services            = var.kubernetes_istio_common_virtual_services
  istio_test_virtual_services        = var.kubernetes_istio_test_virtual_services
  failover_from_region               = var.kubernetes_istio_failover_from_region
  failover_to_region                 = var.kubernetes_istio_failover_to_region
  virtual_services                   = var.kubernetes_istio_virtual_services
}
