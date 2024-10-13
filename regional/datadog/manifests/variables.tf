variable "datadog_api_key" {
  description = "Datadog API key"
  type        = string
  sensitive   = true
}

variable "datadog_app_key" {
  description = "Datadog APP key"
  type        = string
  sensitive   = true
}

variable "remote_bucket" {
  type        = string
  description = "The remote bucket the `terraform_remote_state` data source retrieves the state from"
}
