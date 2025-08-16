# Input Variables
# https://opentofu.org/docs/language/values/variables

variable "remote_bucket" {
  type        = string
  description = "The remote bucket the `terraform_remote_state` data source retrieves the state from"
}
