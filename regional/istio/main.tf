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

# Kubernetes Istio Module (osinfra.io)
# https://github.com/osinfra-io/terraform-kubernetes-istio

module "kubernetes_istio" {
  source = "github.com/osinfra-io/terraform-kubernetes-istio//regional?ref=main"

  artifact_registry          = "us-docker.pkg.dev/plt-lz-services-tf79-prod/plt-docker-virtual"
  cluster_prefix             = "plt"
  enable_istio_gateway       = true
  gateway_cpu_limits         = var.kubernetes_istio_gateway_cpu_limits
  gateway_cpu_requests       = var.kubernetes_istio_gateway_cpu_requests
  gateway_dns                = var.kubernetes_istio_gateway_dns
  gateway_mci_global_address = data.terraform_remote_state.main.outputs.gateway_mci_global_address
  gateway_memory_limits      = var.kubernetes_istio_gateway_memory_limits
  gateway_memory_requests    = var.kubernetes_istio_gateway_memory_requests
  labels                     = module.helpers.labels

  multi_cluster_service_clusters = [
    {
      "link" = "us-east1/plt-us-east1-b"
    },
    # {
    #   "link" = "us-east4/plt-us-east4-a"
    # }
  ]

  pilot_cpu_limits      = var.kubernetes_istio_pilot_cpu_limits
  pilot_cpu_requests    = var.kubernetes_istio_pilot_cpu_requests
  pilot_memory_limits   = var.kubernetes_istio_pilot_memory_limits
  pilot_memory_requests = var.kubernetes_istio_pilot_memory_requests
  project               = data.google_project.this.project_id
  proxy_cpu_limits      = var.kubernetes_istio_proxy_cpu_limits
  proxy_cpu_requests    = var.kubernetes_istio_proxy_cpu_requests
  proxy_memory_limits   = var.kubernetes_istio_proxy_memory_limits
  proxy_memory_requests = var.kubernetes_istio_proxy_memory_requests
}
