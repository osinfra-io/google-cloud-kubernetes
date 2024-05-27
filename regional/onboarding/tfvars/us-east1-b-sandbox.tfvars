namespaces = {
  istio-system = {
    annotations = {
      "istio-system topology.istio.io/controlPlaneClusters" = "services-us-east4-a"
    }
    google_service_account = "plt-k8s-github@ptl-lz-terraform-tf91-sb.iam.gserviceaccount.com"
    istio_injection        = "disabled"
  }
}

region        = "us-east1"
remote_bucket = "plt-k8s-2c8b-sb"
zone          = "b"
