# Input Variables
# https://www.terraform.io/language/values/variables

variable "kubernetes_engine_namespaces" {
  description = "Map of namespaces and service accounts to onboard to GKE"
  type        = map(any)
}

variable "remote_bucket" {
  type        = string
  description = "The remote bucket the `terraform_remote_state` data source retrieves the state from"
}
