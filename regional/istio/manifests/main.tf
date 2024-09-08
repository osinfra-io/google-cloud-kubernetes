# Required Providers
# https://www.terraform.io/docs/language/providers/requirements.html#requiring-providers

terraform {
  required_providers {

    # Google Cloud Provider
    # https://www.terraform.io/docs/providers/google/index.html

    google = {
      source = "hashicorp/google"
    }

    kubernetes = {
      source = "hashicorp/kubernetes"
    }
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

module "kubernetes_istio_manifests" {
  source = "github.com/osinfra-io/terraform-kubernetes-istio//regional/manifests?ref=lables"

  common_gke_info_istio_virtual_services = var.common_gke_info_istio_virtual_services
  common_istio_virtual_services          = var.common_istio_virtual_services
  gke_info_istio_virtual_services        = var.gke_info_istio_virtual_services
  istio_failover_from_region             = var.istio_failover_from_region
  istio_failover_to_region               = var.istio_failover_to_region
  istio_virtual_services                 = var.istio_virtual_services
}
