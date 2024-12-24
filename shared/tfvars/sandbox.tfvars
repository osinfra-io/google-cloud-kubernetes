kubernetes_engine_namespaces = {
  backstage = {
    google_service_account = "plt-backstage-github@plt-lz-terraform-tf00-sb.iam.gserviceaccount.com"
  }

  gke-info = {
    google_service_account = "plt-gke-info-github@plt-lz-terraform-tf00-sb.iam.gserviceaccount.com"
    istio_injection        = "enabled"
  }
}
