environment   = "production"
region        = "us-east1"
remote_bucket = "plt-k8s-e194-prod"

gateway_dns = {
  "us-east1-b.gcp.osinfra.io" = {
    managed_zone = "gcp-osinfra-io"
    project      = "plt-lz-networking-tfcb-prod"
  }
}

zone = "b"
