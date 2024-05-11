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
