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

module "datadog" {
  source = "github.com/osinfra-io/terraform-datadog-google-integration//global?ref=v0.1.3"
  count  = var.enable_datadog ? 1 : 0

  api_key         = var.datadog_api_key
  cost_center     = "x001"
  is_cspm_enabled = true


  labels = {
    env        = var.environment
    repository = "google-cloud-kubernetes"
    platform   = "google-cloud-kubernetes"
    team       = "platform-google-cloud-kubernetes"
  }

  project = module.project.project_id
}

# Google Project Module (osinfra.io)
# https://github.com/osinfra-io/terraform-google-project

module "project" {
  source = "github.com/osinfra-io/terraform-google-project//global?ref=v0.1.9"

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
    "billingbudgets.googleapis.com",
    "cloudasset.googleapis.com",
    "cloudbilling.googleapis.com",
    "cloudkms.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "compute.googleapis.com",
    "container.googleapis.com",
    "dns.googleapis.com",
    "gkehub.googleapis.com",
    "iam.googleapis.com",
    "monitoring.googleapis.com",
    "multiclusteringress.googleapis.com",
    "multiclusterservicediscovery.googleapis.com",
    "servicenetworking.googleapis.com",
    "serviceusage.googleapis.com",
    "trafficdirector.googleapis.com"
  ]
}

# Google Kubernetes Engine Module (osinfra.io)
# https://github.com/osinfra-io/terraform-google-kubernetes-engine

module "kubernetes" {
  source = "github.com/osinfra-io/terraform-google-kubernetes-engine//global?ref=brettcurtis%2Fissue17"

  istio_gateway_ssl = var.istio_gateway_ssl
  project_id        = module.project.project_id
}
