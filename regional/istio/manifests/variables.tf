variable "environment" {
  description = "The environment for example: `sandbox`, `non-production`, `production`"
  type        = string
  default     = "sandbox"
}

variable "common_gke_info_istio_virtual_services" {
  description = "The map of Istio VirtualServices to create for GKE Info, that are common among all regions"
  type = map(object({
    destination_host = string
    host             = string
  }))
}

variable "common_istio_virtual_services" {
  description = "The map of Istio VirtualServices to create, that are common among all regions"
  type = map(object({
    destination_host = string
    destination_port = optional(number, 8080)
    host             = string
  }))
}

variable "gke_info_istio_virtual_services" {
  description = "The map of Istio VirtualServices to create for GKE Info"
  type = map(object({
    destination_host = string
    host             = string
  }))
}

variable "istio_failover_from_region" {
  description = "The region to fail over from"
  type        = string
  default     = ""
}

variable "istio_failover_to_region" {
  description = "The region to fail over to"
  type        = string
  default     = ""
}

variable "istio_virtual_services" {
  description = "The map of Istio VirtualServices to create, that are unique to a region"
  type = map(object({
    destination_host = string
    destination_port = optional(number, 8080)
    host             = string
  }))
}

variable "region" {
  description = "The region to deploy the resources to"
  type        = string
}

variable "remote_bucket" {
  type        = string
  description = "The remote bucket the `terraform_remote_state` data source retrieves the state from"
}

variable "zone" {
  description = "The zone to deploy the resources to"
  type        = string
}
