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

data "terraform_remote_state" "regional" {
  backend = "gcs"

  config = {
    bucket = var.remote_bucket
    prefix = "google-cloud-kubernetes"
  }

  workspace = "${var.region}-${var.zone}-${var.environment}"
}

# Kubernetes Open Policy Agent Gatekeeper Module (osinfra.io)
# https://github.com/osinfra-io/terraform-kubernetes-opa-gatekeeper

module "kubernetes_opa_gatekeeper" {
  source = "github.com/osinfra-io/terraform-kubernetes-opa-gatekeeper//regional?ref=v0.1.0"

  environment = var.environment
  region      = var.region
}
