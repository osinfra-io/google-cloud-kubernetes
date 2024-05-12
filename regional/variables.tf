variable "environment" {
  description = "The environment for example: `sandbox`, `non-production`, `production`"
  type        = string
  default     = "sandbox"
}

variable "enable_gke_hub_host" {
  description = "Whether or not to enable GKE Hub Host"
  type        = bool
  default     = false
}

variable "gke_hub_memberships" {
  description = "The map of GKE Hub Memberships to create"
  type = map(object({
    cluster_id = string
  }))
  default = {}
}

variable "master_ipv4_cidr_block" {
  description = "The IP range in CIDR notation to use for the hosted master network"
  type        = string
}

variable "node_location" {
  description = "The zone to deploy the nodes to"
  type        = string
}

variable "node_pools" {
  description = "The node pools to create in the cluster"
  type = map(object({
    auto_repair                              = optional(bool)
    auto_upgrade                             = optional(bool)
    disk_size_gb                             = optional(number)
    disk_type                                = optional(string)
    image_type                               = optional(string)
    machine_type                             = optional(string)
    max_node_count                           = optional(number, 3)
    min_node_count                           = optional(number, 0)
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
    standard-pool = {
      machine_type   = "e2-standard-2"
      max_node_count = 1
      min_node_count = 0
    }
  }
}

variable "region" {
  description = "The region to deploy the resources to"
  type        = string
}

variable "remote_bucket" {
  type        = string
  description = "The remote bucket the `terraform_remote_state` data source retrieves the state from"
}

variable "vpc_host_project_id" {
  description = "Host project for the shared VPC"
  type        = string
}

variable "zone" {
  description = "The zone to deploy the resources to"
  type        = string
}
