# OpenTofu Remote State Datasource
# https://opentofu.org/docs/language/state/remote-state-data/

data "terraform_remote_state" "main" {
  backend = "gcs"

  config = {
    bucket             = var.remote_bucket
    kms_encryption_key = var.state_kms_encryption_key
    prefix             = module.helpers.repository
  }

  workspace = "main-${module.helpers.environment}"
}

# Google Kubernetes Engine Module (osinfra.io)
# https://github.com/osinfra-io/opentofu-google-kubernetes-engine

module "kubernetes_engine_regional" {
  # source = "github.com/osinfra-io/opentofu-google-kubernetes-engine//regional?ref=e67d2b9113d150efd7a68bb599795343f9e3620c" # v0.2.5
  source = "github.com/osinfra-io/opentofu-google-kubernetes-engine//regional?ref=configsync"

  cluster_prefix                = "plt"
  cluster_secondary_range_name  = "k8s-secondary-pods"
  enable_deletion_protection    = false
  gke_hub_memberships           = var.kubernetes_engine_gke_hub_memberships
  labels                        = module.helpers.labels
  network                       = "standard-shared"
  node_pools                    = var.kubernetes_engine_node_pools
  master_ipv4_cidr_block        = var.kubernetes_engine_master_ipv4_cidr_block
  project                       = local.main.project_id
  resource_labels               = module.helpers.labels
  services_secondary_range_name = "k8s-secondary-services"
  subnet                        = local.subnet
  vpc_host_project_id           = var.kubernetes_engine_vpc_host_project_id
}
