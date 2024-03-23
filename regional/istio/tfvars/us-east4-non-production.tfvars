environment   = "non-production"
region        = "us-east4"
remote_bucket = "plt-k8s-3bfe-nonprod"

istio_gateway_dns = {
  "us-east4.nonprod.gcp.osinfra.io" = {
    managed_zone = "nonprod-gcp-osinfra-io"
    project      = "plt-lz-networking-tf81-nonprod"
  }
}
