cis_2_2_logging_sink_project_id = "plt-lz-audit01-tf92-sb"
enable_datadog                  = true
folder_id                       = "589091281803"

istio_gateway_dns = {
  "sb.gcp.osinfra.io" = {
    managed_zone = "sb-gcp-osinfra-io"
    project      = "plt-lz-networking-tfd8-sb"
  }
}

monthly_budget_amount = 25
