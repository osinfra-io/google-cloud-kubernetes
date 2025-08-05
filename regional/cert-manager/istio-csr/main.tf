# Terraform Remote State Datasource
# https://www.terraform.io/docs/language/state/remote-state-data.html

data "terraform_remote_state" "main" {
  backend = "gcs"

  config = {
    bucket = var.remote_bucket
    prefix = module.helpers.repository
  }

  workspace = "main-${module.helpers.environment}"
}

# Kubernetes cert-manager Module (osinfra.io)
# https://github.com/osinfra-io/terraform-kubernetes-cert-manager

module "kubernetes_cert_manager_istio_csr" {
  source = "github.com/osinfra-io/terraform-kubernetes-cert-manager//regional/istio-csr?ref=v0.1.8"

  artifact_registry                           = "us-docker.pkg.dev/plt-lz-services-tf79-prod/plt-docker-virtual"
  cluster_prefix                              = "plt"
  tls_self_signed_cert_cert_manager_root_cert = local.main.kubernetes_cert_manager_tls_self_signed_cert_cert_manager_root_cert
  tls_self_signed_cert_cert_manager_root_key  = local.main.kubernetes_cert_manager_tls_self_signed_cert_cert_manager_root_key
}
