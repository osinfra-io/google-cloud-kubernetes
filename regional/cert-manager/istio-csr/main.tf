# Kubernetes cert-manager Module (osinfra.io)
# https://github.com/osinfra-io/terraform-kubernetes-cert-manager

module "kubernetes_cert_manager_istio_csr" {
  source = "github.com/osinfra-io/terraform-kubernetes-cert-manager//regional/istio-csr?ref=main"

  artifact_registry = "us-docker.pkg.dev/plt-lz-services-tf79-prod/plt-docker-virtual"
  cluster_prefix    = "plt"
}
