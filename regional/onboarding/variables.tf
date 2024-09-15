# Input Variables
# https://www.terraform.io/language/values/variables

variable "environment" {
  description = "The environment for example: `sandbox`, `non-production`, `production`"
  type        = string
  default     = "sandbox"
}

variable "kubernetes_engine_namespaces" {
  description = "Map of namespaces and service accounts to onboard to GKE"
  type        = map(any)
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
