environment = "production"
kubernetes_istio_gateway_dns = {
  "us-east4-a.gcp.osinfra.io" = {
    managed_zone = "gcp-osinfra-io"
    project      = "plt-lz-networking-tfcb-prod"
  }
}
region        = "us-east4"
remote_bucket = "plt-k8s-e194-prod"
zone          = "a"
