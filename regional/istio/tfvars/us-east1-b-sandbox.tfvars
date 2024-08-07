istio_gateway_cpu_request = "50m"
istio_gateway_cpu_limit   = "1000m"

istio_gateway_dns = {
  "us-east1-b.sb.gcp.osinfra.io" = {
    managed_zone = "sb-gcp-osinfra-io"
    project      = "plt-lz-networking-tfd8-sb"
  }
}

istio_gateway_memory_request = "64Mi"
istio_gateway_memory_limit   = "512Mi"
istio_pilot_cpu_request      = "250m"
istio_pilot_cpu_limit        = "500m"
istio_pilot_memory_request   = "1024Mi"
istio_pilot_memory_limit     = "2048Mi"
istio_proxy_cpu_request      = "50m"
istio_proxy_cpu_limit        = "1000m"
istio_proxy_memory_request   = "64Mi"
istio_proxy_memory_limit     = "512Mi"
istio_remote_injection_path  = "inject/cluster/services-us-east1-b/net/standard-shared"
istio_remote_injection_url   = "https://istiod.istio-system.clusterset.local:15017"
region                       = "us-east1"
remote_bucket                = "plt-k8s-2c8b-sb"
zone                         = "b"
