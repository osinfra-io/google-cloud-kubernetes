# Input Variables
# https://opentofu.org/docs/language/values/variables

variable "kubernetes_engine_enable_gke_hub_host" {
  description = "Whether or not to enable GKE Hub Host"
  type        = bool
  default     = false
}

variable "kubernetes_engine_gke_hub_memberships" {
  description = "The map of GKE Hub Memberships to create"
  type = map(object({
    cluster_id = string
  }))
  default = {}
}

variable "kubernetes_engine_master_ipv4_cidr_block" {
  description = "The IP range in CIDR notation to use for the hosted master network"
  type        = string
}

variable "kubernetes_engine_node_location" {
  description = "The zone to deploy the nodes to"
  type        = string
}

variable "kubernetes_engine_node_pools" {
  description = "The node pools to create in the cluster"
  type = map(object({
    auto_repair                              = optional(bool)
    auto_upgrade                             = optional(bool)
    disk_size_gb                             = optional(number)
    disk_type                                = optional(string)
    image_type                               = optional(string)
    machine_type                             = optional(string)
    max_node_count                           = optional(number, 3)
    min_node_count                           = optional(number, 1)
    node_count                               = optional(number)
    oauth_scopes                             = optional(list(string), ["https://www.googleapis.com/auth/cloud-platform"])
    upgrade_settings_batch_node_count        = optional(number)
    upgrade_settings_batch_percentage        = optional(number)
    upgrade_settings_batch_soak_duration     = optional(string)
    upgrade_settings_node_pool_soak_duration = optional(string)
    upgrade_settings_max_surge               = optional(number)
    upgrade_settings_max_unavailable         = optional(number, 1) # https://github.com/hashicorp/terraform-provider-google/issues/17164
    upgrade_settings_strategy                = optional(string, "SURGE")
  }))

  default = {
    default-pool = {
      machine_type = "n2-standard-2"
    }
  }
}

variable "kubernetes_engine_vpc_host_project_id" {
  description = "Host project for the shared VPC"
  type        = string
}

variable "remote_bucket" {
  type        = string
  description = "The remote bucket the `terraform_remote_state` data source retrieves the state from"
}

# These three state_* variables are required for early variable evaluation for backend and provider configuration.
# They are defined in the GitHub Actions called workflows and should NOT be set in the OpenTofu configuration.

variable "state_bucket" {
  description = "The name of the GCS bucket to store state files"
  type        = string
}

variable "state_kms_encryption_key" {
  description = "The KMS encryption key for state and plan files"
  type        = string
}

variable "state_prefix" {
  description = "The prefix for state files in the GCS bucket"
  type        = string
}
