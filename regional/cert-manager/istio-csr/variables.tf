# Input Variables
# https://www.terraform.io/language/values/variables

variable "cert_manager_istio_csr_cluster_id" {
  description = "The cluster ID to use for the Istio CSR"
  type        = string
}

variable "remote_bucket" {
  type        = string
  description = "The remote bucket the `terraform_remote_state` data source retrieves the state from"
}
