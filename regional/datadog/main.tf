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

# Kubernetes Datadog Operator Module (osinfra.io)
# https://github.com/osinfra-io/terraform-kubernetes-datadog-operator

# module "kubernetes_datadog_operator" {
#   source = "github.com/osinfra-io/terraform-kubernetes-datadog-operator//regional?ref=v0.1.2"

#   api_key                 = var.datadog_api_key
#   app_key                 = var.datadog_app_key
#   environment             = var.environment
#   kubernetes_cluster_name = local.regional.kubernetes_engine_container_cluster_name
#   region                  = var.region
# }
