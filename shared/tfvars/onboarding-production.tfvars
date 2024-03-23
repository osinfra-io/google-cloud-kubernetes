namespaces = {
  backstage = {
    google_service_account = "plt-backstage-github@ptl-lz-terraform-tf62-prod.iam.gserviceaccount.com"
    istio_injection        = "disabled"
  }

  istio-ingress = {
    google_service_account = "plt-k8s-github@ptl-lz-terraform-tf62-prod.iam.gserviceaccount.com"
    istio_injection        = "enabled"
  }

  istio-system = {
    google_service_account = "plt-k8s-github@ptl-lz-terraform-tf62-prod.iam.gserviceaccount.com"
    istio_injection        = "disabled"
  }
}
