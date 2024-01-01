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

# Terraform Remote State Datasource
# https://www.terraform.io/docs/language/state/remote-state-data.html

data "terraform_remote_state" "regional" {
  backend = "gcs"

  config = {
    bucket = var.remote_bucket
    prefix = "google-cloud-kubernetes"
  }

  workspace = "${var.region}-${var.environment}"
}

# Google Kubernetes Engine Module (osinfra.io)
# https://github.com/osinfra-io/terraform-google-kubernetes-engine

module "kubernetes" {
  #source = "github.com/osinfra-io/terraform-google-kubernetes-engine//regional/onboarding?ref=v0.1.0"
  source   = "github.com/osinfra-io/terraform-google-kubernetes-engine//regional/onboarding"
  for_each = var.namespaces

  google_service_account = each.value.google_service_account
  namespaces             = each.value.namespaces
  project_id             = local.regional.project_id
}
