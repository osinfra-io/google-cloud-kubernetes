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

module "kubernetes" {
  source = "github.com/osinfra-io/terraform-google-kubernetes-engine//regional?ref=v0.1.0"

  count = var.enable_cluster ? 1 : 0

  cluster_autoscaling = {
    enabled = true
  }

  cluster_prefix               = "services"
  cluster_secondary_range_name = "services-k8s-pods-${var.region}"
  enable_deletion_protection   = false
  host_project_id              = var.host_project_id

  labels = {
    env        = var.environment
    repository = "google-cloud-kubernetes"
    platform   = "google-cloud-kubernetes"
    team       = "platform-google-cloud-kubernetes"
  }

  network = "standard-shared"

  master_ipv4_cidr_block        = var.master_ipv4_cidr_block
  project_id                    = local.global.project_id
  project_number                = local.global.project_number
  region                        = var.region
  services_secondary_range_name = "services-k8s-services-${var.region}"
  subnet                        = "services-${var.region}"
}
