#datadog_enable = true

kubernetes_istio_gateway_dns = {
  "sb.gcp.osinfra.io" = {
    managed_zone = "sb-gcp-osinfra-io"
    project      = "plt-lz-networking-tfd8-sb"
  }
}

kubernetes_engine_shared_vpc_host_project_id = "plt-lz-networking-tfd8-sb"
project_cis_2_2_logging_sink_project_id      = "plt-lz-audit01-tf92-sb"
project_folder_id                            = "589091281803"
project_monthly_budget_amount                = 25
