istio_gateway_cpu_request = "50m"
istio_gateway_cpu_limit   = "1000m"

gateway_dns = {
  "us-east4-b.sb.gcp.osinfra.io" = {
    managed_zone = "sb-gcp-osinfra-io"
    project      = "plt-lz-networking-tfd8-sb"
  }
}

region        = "us-east4"
remote_bucket = "plt-k8s-2c8b-sb"
zone          = "b"
