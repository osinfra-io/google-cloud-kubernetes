# Required Providers
# https://www.terraform.io/docs/language/providers/requirements.html#requiring-providers

terraform {
  required_providers {

    # Google Cloud Provider
    # https://www.terraform.io/docs/providers/google/index.html

    google = {
      source = "hashicorp/google"
    }

    helm = {
      source = "hashicorp/helm"
    }

    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
}

# Helm Provider
# https://registry.terraform.io/providers/hashicorp/helm/latest

provider "helm" {
  kubernetes {

    cluster_ca_certificate = base64decode(
      local.regional.kubernetes_engine_container_cluster_ca_certificate
    )

    host  = local.regional.kubernetes_engine_container_cluster_endpoint
    token = data.google_client_config.current.access_token
  }
}

# Kubernetes Provider
# https://registry.terraform.io/providers/hashicorp/kubernetes/latest

provider "kubernetes" {
  cluster_ca_certificate = base64decode(
    local.regional.kubernetes_engine_container_cluster_ca_certificate
  )
  host  = "https://${local.regional.kubernetes_engine_container_cluster_endpoint}"
  token = data.google_client_config.current.access_token
}

# Google Client Config Data Source
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config

data "google_client_config" "current" {
}

# Terraform Remote State Datasource
# https://www.terraform.io/docs/language/state/remote-state-data.html

data "terraform_remote_state" "main" {
  backend = "gcs"

  config = {
    bucket = var.remote_bucket
    prefix = "google-cloud-kubernetes"
  }

  workspace = "main-${var.environment}"
}

data "terraform_remote_state" "regional" {
  backend = "gcs"

  config = {
    bucket = var.remote_bucket
    prefix = "google-cloud-kubernetes"
  }

  workspace = "${var.region}-${var.zone}-${var.environment}"
}

# Kubernetes Istio Module (osinfra.io)
# https://github.com/osinfra-io/terraform-kubernetes-istio

module "kubernetes_istio" {
  source = "github.com/osinfra-io/terraform-kubernetes-istio//regional?ref=cert"

  artifact_registry          = "us-docker.pkg.dev/plt-lz-services-tf79-prod/plt-docker-virtual"
  cluster_prefix             = "plt"
  enable_istio_gateway       = true
  environment                = var.environment
  gateway_cpu_limits         = var.kubernetes_istio_gateway_cpu_limits
  gateway_cpu_requests       = var.kubernetes_istio_gateway_cpu_requests
  gateway_dns                = var.kubernetes_istio_gateway_dns
  gateway_mci_global_address = local.main.kubernetes_istio_gateway_mci_global_address
  gateway_memory_limits      = var.kubernetes_istio_gateway_memory_limits
  gateway_memory_requests    = var.kubernetes_istio_gateway_memory_requests
  labels                     = local.labels

  multi_cluster_service_clusters = [
    {
      "link" = "us-east1/plt-us-east1-b"
    },
    {
      "link" = "us-east4/plt-us-east4-a"
    }
  ]

  pilot_cpu_limits      = var.kubernetes_istio_pilot_cpu_limits
  pilot_cpu_requests    = var.kubernetes_istio_pilot_cpu_requests
  pilot_memory_limits   = var.kubernetes_istio_pilot_memory_limits
  pilot_memory_requests = var.kubernetes_istio_pilot_memory_requests
  project               = local.regional.project_id
  proxy_cpu_limits      = var.kubernetes_istio_proxy_cpu_limits
  proxy_cpu_requests    = var.kubernetes_istio_proxy_cpu_requests
  proxy_memory_limits   = var.kubernetes_istio_proxy_memory_limits
  proxy_memory_requests = var.kubernetes_istio_proxy_memory_requests

  region = var.region
}
