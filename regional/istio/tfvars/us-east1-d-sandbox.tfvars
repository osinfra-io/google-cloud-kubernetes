region        = "us-east1"
remote_bucket = "plt-k8s-2c8b-sb"


istio_gateway_dns = {
  "us-east1-d.sb.gcp.osinfra.io" = {
    managed_zone = "sb-gcp-osinfra-io"
    project      = "plt-lz-networking-tfd8-sb"
  }
}

zone = "d"
