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

  workspace = "main-${module.helpers.environment}"
}

# Google Kubernetes Engine Module (osinfra.io)
# https://github.com/osinfra-io/terraform-google-kubernetes-engine

module "kubernetes_engine_regional" {
  source = "github.com/osinfra-io/terraform-google-kubernetes-engine//regional?ref=main"

  cluster_prefix               = "plt"
  cluster_secondary_range_name = "k8s-secondary-pods"
  enable_deletion_protection   = false
  enable_gke_hub_host          = var.kubernetes_engine_enable_gke_hub_host
  gke_hub_memberships          = var.kubernetes_engine_gke_hub_memberships
  labels                       = module.helpers.labels
  network                      = "standard-shared"
  node_pools                   = var.kubernetes_engine_node_pools
  master_ipv4_cidr_block       = var.kubernetes_engine_master_ipv4_cidr_block
  project                      = local.main.project_id

  resource_labels = {
    env        = module.helpers.environment
    region     = module.helpers.region
    repository = "google-cloud-kubernetes"
    platform   = "google-cloud-kubernetes"
    team       = "platform-google-cloud-kubernetes"
  }

  services_secondary_range_name = "k8s-secondary-services"
  subnet                        = local.subnet
  vpc_host_project_id           = var.kubernetes_engine_vpc_host_project_id
}
