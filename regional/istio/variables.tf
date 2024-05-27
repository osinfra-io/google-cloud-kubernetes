variable "environment" {
  description = "The environment for example: `sandbox`, `non-production`, `production`"
  type        = string
  default     = "sandbox"
}

variable "istio_external_istiod" {
  description = "Boolean to configure a remote cluster data plane controlled by an external istiod"
  type        = bool
  default     = false
}

variable "istio_gateway_cpu_request" {
  description = "The CPU request for the Istio gateway"
  type        = string
  default     = "100m"
}

variable "istio_gateway_cpu_limit" {
  description = "The CPU limit for the Istio gateway"
  type        = string
  default     = "2000m"
}

variable "istio_gateway_dns" {
  description = "Map of attributes for the Istio gateway domain names, it is also used to create the managed certificate resource"
  type = map(object({
    managed_zone = string
    project      = string
  }))
  default = {}
}

variable "istio_gateway_memory_request" {
  description = "The memory request for the Istio gateway"
  type        = string
  default     = "128Mi"
}

variable "istio_gateway_memory_limit" {
  description = "The memory limit for the Istio gateway"
  type        = string
  default     = "1024Mi"
}

variable "istio_pilot_autoscale_min" {
  description = "The minimum number of Istio pilot replicas to run"
  type        = number
  default     = 1
}

variable "istio_pilot_cpu_request" {
  description = "The CPU request for the Istio pilot"
  type        = string
  default     = "500m"
}

variable "istio_pilot_cpu_limit" {
  description = "The CPU limit for the Istio pilot"
  type        = string
  default     = "1000m"
}

variable "istio_pilot_memory_request" {
  description = "The memory request for the Istio pilot"
  type        = string
  default     = "2048Mi"
}

variable "istio_pilot_memory_limit" {
  description = "The memory limit for the Istio pilot"
  type        = string
  default     = "4096Mi"
}

variable "istio_pilot_replica_count" {
  description = "The number of Istio pilot replicas to run"
  type        = number
  default     = 1
}

variable "istio_proxy_cpu_request" {
  description = "The CPU request for the Istio proxy"
  type        = string
  default     = "100m"
}

variable "istio_proxy_cpu_limit" {
  description = "The CPU limit for the Istio proxy"
  type        = string
  default     = "2000m"
}

variable "istio_proxy_memory_request" {
  description = "The memory request for the Istio proxy"
  type        = string
  default     = "128Mi"
}

variable "istio_proxy_memory_limit" {
  description = "The memory limit for the Istio proxy"
  type        = string
  default     = "1024Mi"
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

variable "istio_remote_pilot_address" {
  description = "The remote pilot and istiod service and endpoint"
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
