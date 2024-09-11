istio_gateway_cpu_request = "50m"
istio_gateway_cpu_limit   = "1000m"

istio_gateway_dns = {
  "us-east4-b.sb.gcp.osinfra.io" = {
    managed_zone = "sb-gcp-osinfra-io"
    project      = "plt-lz-networking-tfd8-sb"
  }
}

istio_gateway_memory_requests = "64Mi"
istio_gateway_memory_limits   = "512Mi"
istio_pilot_cpu_requests      = "250m"
istio_pilot_cpu_limits        = "500m"
istio_pilot_memory_requests   = "1024Mi"
istio_pilot_memory_limits     = "2048Mi"
istio_proxy_cpu_requests      = "50m"
istio_proxy_cpu_limits        = "1000m"
istio_proxy_memory_requests   = "64Mi"
istio_proxy_memory_limits     = "512Mi"
region                        = "us-east4"
remote_bucket                 = "plt-k8s-2c8b-sb"
zone                          = "b"
