environment   = "non-production"
region        = "us-east1"
remote_bucket = "plt-k8s-3bfe-nonprod"

gateway_dns = {
  "us-east1-b.nonprod.gcp.osinfra.io" = {
    managed_zone = "nonprod-gcp-osinfra-io"
    project      = "plt-lz-networking-tf81-nonprod"
  }
}

zone = "b"
