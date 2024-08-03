# Required Providers
# https://www.terraform.io/docs/language/providers/requirements.html#requiring-providers

terraform {
  required_providers {

    # Google Cloud Provider
    # https://www.terraform.io/docs/providers/google/index.html

    google = {
      source = "hashicorp/google"
    }
  }
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

# Google Kubernetes Engine Module (osinfra.io)
# https://github.com/osinfra-io/terraform-google-kubernetes-engine

module "kubernetes_engine_regional" {
  source = "github.com/osinfra-io/terraform-google-kubernetes-engine//regional?ref=v0.1.6"

  cluster_prefix               = "services"
  cluster_secondary_range_name = "k8s-secondary-pods"
  enable_deletion_protection   = false
  enable_gke_hub_host          = var.enable_gke_hub_host
  gke_hub_memberships          = var.gke_hub_memberships
  labels                       = local.labels
  network                      = "standard-shared"
  node_location                = var.node_location
  node_pools                   = var.node_pools
  master_ipv4_cidr_block       = var.master_ipv4_cidr_block
  project                      = local.main.project_id

  resource_labels = {
    env        = var.environment
    region     = var.region
    repository = "google-cloud-kubernetes"
    platform   = "google-cloud-kubernetes"
    team       = "platform-google-cloud-kubernetes"
  }

  region                        = var.region
  services_secondary_range_name = "k8s-secondary-services"
  subnet                        = "services-${var.region}-${var.zone}"
  vpc_host_project_id           = var.vpc_host_project_id
}
