istio_gateway_cpu_request = "50m"
istio_gateway_cpu_limit   = "1000m"

gateway_dns = {
  "us-east1-b.sb.gcp.osinfra.io" = {
    managed_zone = "sb-gcp-osinfra-io"
    project      = "plt-lz-networking-tfd8-sb"
  }
}

istio_remote_injection_path = "inject/cluster/plt-us-east1-b/net/standard-shared"
istio_remote_injection_url  = "https://istiod.istio-system.clusterset.local:15017"
region                      = "us-east1"
remote_bucket               = "plt-k8s-2c8b-sb"
zone                        = "b"
