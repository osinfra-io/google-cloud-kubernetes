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

data "terraform_remote_state" "global" {
  backend = "gcs"

  config = {
    bucket = var.remote_bucket
    prefix = "google-cloud-kubernetes"
  }

  workspace = "global-${var.environment}"
}

# Google Kubernetes Engine Module (osinfra.io)
# https://github.com/osinfra-io/terraform-google-kubernetes-engine

module "kubernetes_engine_regional" {
  source      = "github.com/osinfra-io/terraform-google-kubernetes-engine//regional"
  cost_center = "x001"

  cluster_autoscaling = {
    enabled = true
  }

  cluster_prefix               = "services"
  cluster_secondary_range_name = "services-k8s-pods-${var.region}"
  enable_deletion_protection   = false
  enable_gke_hub_host          = true
  gke_hub_memberships          = var.gke_hub_memberships

  labels = {
    env        = var.environment
    repository = "google-cloud-kubernetes"
    platform   = "google-cloud-kubernetes"
    team       = "platform-google-cloud-kubernetes"
  }

  network = "standard-shared"

  master_ipv4_cidr_block = var.master_ipv4_cidr_block
  project_id             = local.global.project_id

  resource_labels = {
    env        = "sb"
    region     = var.region
    repository = "terraform-google-kubernetes-engine"
    team       = "kitchen"
  }

  region                        = var.region
  services_secondary_range_name = "services-k8s-services-${var.region}"
  subnet                        = "services-${var.region}"
  vpc_host_project_id           = var.vpc_host_project_id
}
