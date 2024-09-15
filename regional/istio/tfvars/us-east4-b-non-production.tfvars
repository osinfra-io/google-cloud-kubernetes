environment = "non-production"
kubernetes_istio_gateway_dns = {
  "us-east4-b.nonprod.gcp.osinfra.io" = {
    managed_zone = "nonprod-gcp-osinfra-io"
    project      = "plt-lz-networking-tf81-nonprod"
  }
}
region        = "us-east4"
remote_bucket = "plt-k8s-3bfe-nonprod"
zone          = "b"
