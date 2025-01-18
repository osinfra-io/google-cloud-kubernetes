kubernetes_engine_namespaces = {
  backstage = {
    google_service_account = "plt-backstage-github@plt-lz-terraform-tf00-sb.iam.gserviceaccount.com"
  }

  istio-test = {
    google_service_account = "plt-k8s-github@plt-lz-terraform-tf00-sb.iam.gserviceaccount.com"
    istio_injection        = "enabled"
  }
}
