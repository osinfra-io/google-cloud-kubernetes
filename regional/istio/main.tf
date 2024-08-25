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
      local.regional.container_cluster_ca_certificate
    )

    host  = local.regional.container_cluster_endpoint
    token = data.google_client_config.current.access_token
  }
}

# Kubernetes Provider
# https://registry.terraform.io/providers/hashicorp/kubernetes/latest

provider "kubernetes" {
  cluster_ca_certificate = base64decode(
    local.regional.container_cluster_ca_certificate
  )
  host  = "https://${local.regional.container_cluster_endpoint}"
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
  source = "github.com/osinfra-io/terraform-kubernetes-istio//regional?ref=brettcurtis%2Fissue2"

  artifact_registry                = "us-docker.pkg.dev/plt-lz-services-tf79-prod/platform-docker-virtual"
  cluster_prefix                   = "services"
  enable_istio_gateway             = true
  environment                      = var.environment
  istio_gateway_dns                = var.istio_gateway_dns
  istio_gateway_mci_global_address = local.main.istio_gateway_mci_global_address
  istio_gateway_memory_request     = var.istio_gateway_memory_request
  istio_gateway_memory_limit       = var.istio_gateway_memory_limit
  istio_pilot_cpu_request          = var.istio_pilot_cpu_request
  istio_pilot_cpu_limit            = var.istio_pilot_cpu_limit
  istio_pilot_memory_request       = var.istio_pilot_memory_request
  istio_pilot_memory_limit         = var.istio_pilot_memory_limit
  istio_proxy_cpu_request          = var.istio_proxy_cpu_request
  istio_proxy_cpu_limit            = var.istio_proxy_cpu_limit
  istio_proxy_memory_request       = var.istio_proxy_memory_request
  istio_proxy_memory_limit         = var.istio_proxy_memory_limit
  # labels                       = local.labels

  multi_cluster_service_clusters = [
    {
      "link" = "us-east1/services-us-east1-b"
    },
    {
      "link" = "us-east4/services-us-east4-a"
    }
  ]

  project = local.regional.project_id
  region  = var.region
}
