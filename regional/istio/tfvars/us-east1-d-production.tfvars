environment   = "production"
region        = "us-east1"
remote_bucket = "plt-k8s-e194-prod"

istio_gateway_dns = {
  "us-east1-d.gcp.osinfra.io" = {
    managed_zone = "gcp-osinfra-io"
    project      = "plt-lz-networking-tfcb-prod"
  }
}

zone = "d"
