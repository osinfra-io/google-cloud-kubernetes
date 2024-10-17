# Input Variables
# https://www.terraform.io/language/values/variables

variable "kubernetes_istio_common_gke_info_virtual_services" {
  description = "The map of Istio VirtualServices to create for GKE Info, that are common among all regions"
  type = map(object({
    destination_host = string
    host             = string
  }))
}

variable "kubernetes_istio_common_virtual_services" {
  description = "The map of Istio VirtualServices to create, that are common among all regions"
  type = map(object({
    destination_host = string
    destination_port = optional(number, 8080)
    host             = string
  }))
}

variable "kubernetes_istio_failover_from_region" {
  description = "The region to fail over from"
  type        = string
  default     = ""
}

variable "kubernetes_istio_failover_to_region" {
  description = "The region to fail over to"
  type        = string
  default     = ""
}

variable "kubernetes_istio_gke_info_virtual_services" {
  description = "The map of Istio VirtualServices to create for GKE Info"
  type = map(object({
    destination_host = string
    host             = string
  }))
}

variable "kubernetes_istio_virtual_services" {
  description = "The map of Istio VirtualServices to create, that are unique to a region"
  type = map(object({
    destination_host = string
    destination_port = optional(number, 8080)
    host             = string
  }))
}

variable "remote_bucket" {
  type        = string
  description = "The remote bucket the `terraform_remote_state` data source retrieves the state from"
}
