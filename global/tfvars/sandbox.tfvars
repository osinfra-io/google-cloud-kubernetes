cis_2_2_logging_sink_project_id = "plt-lz-audit01-tf92-sb"
enable_datadog                  = false
folder_id                       = "589091281803"

istio_gateway_dns = {
  "sb.gcp.osinfra.io" = {
    managed_zone = "sb-gcp-osinfra-io"
    project      = "plt-lz-networking-tfd8-sb"
  }
}

namespaces = {
  istio-system = {
    annotations = {
      "istio-system topology.istio.io/controlPlaneClusters" = "services-us-east4-a"
    }
    google_service_account = "plt-k8s-github@ptl-lz-terraform-tf91-sb.iam.gserviceaccount.com"
    istio_injection        = "disabled"
  }
}
