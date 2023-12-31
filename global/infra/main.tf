terraform {

  # Requiring Providers
  # https://www.terraform.io/language/providers/requirements#requiring-providers

  required_providers {

    # Datadog Provider
    # https://registry.terraform.io/providers/DataDog/datadog/latest/docs

    datadog = {
      source = "datadog/datadog"
    }

    # Google Cloud Platform Provider
    # https://registry.terraform.io/providers/hashicorp/google/latest/docs

    google = {
      source = "hashicorp/google"
    }
  }
}

provider "datadog" {
  api_key = var.datadog_api_key
  app_key = var.datadog_app_key
}

# Datadog Google Cloud Platform Integration Module (osinfra.io)
# https://github.com/osinfra-io/terraform-datadog-google-integration

# module "datadog" {
#   source = "github.com/osinfra-io/terraform-datadog-google-integration//global?ref=v0.1.0"

#   api_key         = var.datadog_api_key
#   is_cspm_enabled = true
#   project         = module.project.project_id
# }

# Google Project Module (osinfra.io)
# https://github.com/osinfra-io/terraform-google-project

module "project" {
  source = "github.com/osinfra-io/terraform-google-project//global?ref=v0.1.8"

  billing_account                 = var.billing_account
  cis_2_2_logging_sink_project_id = var.cis_2_2_logging_sink_project_id
  cost_center                     = "x001"
  description                     = "k8s"
  environment                     = var.environment
  folder_id                       = var.folder_id

  labels = {
    env      = var.environment
    module   = "google-cloud-kubernetes"
    platform = "google-cloud-kubernetes"
    team     = "platform-google-cloud-kubernetes"
  }

  prefix = "plt"

  services = [
    "cloudasset.googleapis.com",
    "cloudbilling.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "compute.googleapis.com",
    "container.googleapis.com",
    "iam.googleapis.com",
    "monitoring.googleapis.com",
    "sqladmin.googleapis.com"
  ]
}

# Google Kubernetes Engine Module (osinfra.io)
# https://github.com/osinfra-io/terraform-google-kubernetes-engine

module "kubernetes" {
  #source = "github.com/osinfra-io/terraform-google-kubernetes-engine//global/onboarding?ref=v0.1.0"
  source   = "github.com/osinfra-io/terraform-google-kubernetes-engine//global/onboarding"
  for_each = var.namespaces

  google_service_account = each.value.google_service_account
  namespaces             = each.value.namespaces
  project_id             = module.project.project_id
}
