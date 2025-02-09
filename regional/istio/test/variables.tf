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

variable "istio_test_replicas" {
  description = "The number of replicas for the istio-test deployment"
  type        = number
  default     = 1
}

variable "istio_test_version" {
  description = "The version of the istio-test deployment"
  type        = string
  default     = "v0.3.2"
}
