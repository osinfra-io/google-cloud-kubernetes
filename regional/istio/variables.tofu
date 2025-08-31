# Input Variables
# https://opentofu.org/docs/language/values/variables

variable "kubernetes_istio_gateway_cpu_limits" {
  description = "The CPU limit for the Istio gateway"
  type        = string
  default     = "100m"
}

variable "kubernetes_istio_gateway_cpu_requests" {
  description = "The CPU request for the Istio gateway"
  type        = string
  default     = "25m"
}

variable "kubernetes_istio_gateway_dns" {
  description = "Map of attributes for the Istio gateway domain names, it is also used to create the managed certificate resource"
  type = map(object({
    managed_zone = string
    project      = string
  }))
  default = {}
}

variable "kubernetes_istio_gateway_memory_limits" {
  description = "The memory limit for the Istio gateway"
  type        = string
  default     = "64Mi"
}

variable "kubernetes_istio_gateway_memory_requests" {
  description = "The memory request for the Istio gateway"
  type        = string
  default     = "32Mi"
}

variable "kubernetes_istio_pilot_autoscale_min" {
  description = "The minimum number of Istio pilot replicas to run"
  type        = number
  default     = 1
}

variable "kubernetes_istio_pilot_cpu_limits" {
  description = "The CPU limit for the Istio pilot"
  type        = string
  default     = "25m"
}

variable "kubernetes_istio_pilot_cpu_requests" {
  description = "The CPU request for the Istio pilot"
  type        = string
  default     = "10m"
}

variable "kubernetes_istio_pilot_memory_limits" {
  description = "The memory limit for the Istio pilot"
  type        = string
  default     = "64Mi"
}

variable "kubernetes_istio_pilot_memory_requests" {
  description = "The memory request for the Istio pilot"
  type        = string
  default     = "32Mi"
}

variable "kubernetes_istio_pilot_replica_count" {
  description = "The number of Istio pilot replicas to run"
  type        = number
  default     = 1
}

variable "kubernetes_istio_proxy_cpu_limits" {
  description = "The CPU limit for the Istio proxy"
  type        = string
  default     = "25m"
}

variable "kubernetes_istio_proxy_cpu_requests" {
  description = "The CPU request for the Istio proxy"
  type        = string
  default     = "10m"
}

variable "kubernetes_istio_proxy_memory_limits" {
  description = "The memory limit for the Istio proxy"
  type        = string
  default     = "64Mi"
}

variable "kubernetes_istio_proxy_memory_requests" {
  description = "The memory request for the Istio proxy"
  type        = string
  default     = "32Mi"
}

variable "remote_bucket" {
  type        = string
  description = "The remote bucket the `terraform_remote_state` data source retrieves the state from"
}

# These three state_* variables are required for early variable evaluation for backend and provider configuration.
# They are defined in the GitHub Actions called workflows and should NOT be set in the OpenTofu configuration.

variable "state_bucket" {
  description = "The name of the GCS bucket to store state files"
  type        = string
}

variable "state_kms_encryption_key" {
  description = "The KMS encryption key for state and plan files"
  type        = string
}

variable "state_prefix" {
  description = "The prefix for state files in the GCS bucket"
  type        = string
}
