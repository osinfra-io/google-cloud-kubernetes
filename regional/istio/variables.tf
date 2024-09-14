variable "environment" {
  description = "The environment for example: `sandbox`, `non-production`, `production`"
  type        = string
  default     = "sandbox"
}

variable "gateway_cpu_requests" {
  description = "The CPU request for the Istio gateway"
  type        = string
  default     = "25m"
}

variable "gateway_cpu_limits" {
  description = "The CPU limit for the Istio gateway"
  type        = string
  default     = "100m"
}

variable "gateway_dns" {
  description = "Map of attributes for the Istio gateway domain names, it is also used to create the managed certificate resource"
  type = map(object({
    managed_zone = string
    project      = string
  }))
  default = {}
}

variable "gateway_memory_requests" {
  description = "The memory request for the Istio gateway"
  type        = string
  default     = "32Mi"
}

variable "gateway_memory_limits" {
  description = "The memory limit for the Istio gateway"
  type        = string
  default     = "64Mi"
}

variable "pilot_autoscale_min" {
  description = "The minimum number of Istio pilot replicas to run"
  type        = number
  default     = 1
}

variable "pilot_cpu_requests" {
  description = "The CPU request for the Istio pilot"
  type        = string
  default     = "25m"
}

variable "pilot_cpu_limits" {
  description = "The CPU limit for the Istio pilot"
  type        = string
  default     = "50m"
}

variable "pilot_memory_requests" {
  description = "The memory request for the Istio pilot"
  type        = string
  default     = "32Mi"
}

variable "pilot_memory_limits" {
  description = "The memory limit for the Istio pilot"
  type        = string
  default     = "64Mi"
}

variable "pilot_replica_count" {
  description = "The number of Istio pilot replicas to run"
  type        = number
  default     = 1
}

variable "proxy_cpu_requests" {
  description = "The CPU request for the Istio proxy"
  type        = string
  default     = "25m"
}

variable "proxy_cpu_limits" {
  description = "The CPU limit for the Istio proxy"
  type        = string
  default     = "50m"
}

variable "proxy_memory_requests" {
  description = "The memory request for the Istio proxy"
  type        = string
  default     = "32Mi"
}

variable "proxy_memory_limits" {
  description = "The memory limit for the Istio proxy"
  type        = string
  default     = "64Mi"
}

variable "istio_remote_injection_path" {
  description = "The sidecar injector mutating webhook configuration path value for the clientConfig.service field"
  type        = string
  default     = "/inject"
}

variable "istio_remote_injection_url" {
  description = "The sidecar injector mutating webhook configuration clientConfig.url value"
  type        = string
  default     = ""
}

variable "istiod_injection_url" {
  description = "The sidecar injector mutating webhook configuration clientConfig.url value"
  type        = string
  default     = ""
}

variable "istiod_injection_path" {
  description = "The sidecar injector mutating webhook configuration path value for the clientConfig.service field"
  type        = string
  default     = "/inject"
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
