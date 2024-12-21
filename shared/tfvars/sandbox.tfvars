kubernetes_engine_namespaces = {
  backstage = {
    google_service_account = "plt-backstage-github@ptl-lz-terraform-tf91-sb.iam.gserviceaccount.com"
  }

  gke-info = {
    google_service_account = "plt-gke-info-github@ptl-lz-terraform-tf91-sb.iam.gserviceaccount.com"
    istio_injection        = "enabled"
  }
}
