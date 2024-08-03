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

# Google Kubernetes Engine Module (osinfra.io)
# https://github.com/osinfra-io/terraform-google-kubernetes-engine

module "kubernetes_engine_mci" {
  source = "github.com/osinfra-io/terraform-google-kubernetes-engine//regional/mci?ref=v0.1.6"

  istio_gateway_mci_global_address = local.main.istio_gateway_mci_global_address

  multi_cluster_service_clusters = [
    {
      "link" = "us-east1/services-us-east1-b"
    },
    {
      "link" = "us-east4/services-us-east4-a"
    }
  ]

  project = local.regional.project_id
}
