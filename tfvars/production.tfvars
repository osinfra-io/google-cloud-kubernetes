environment                     = "production"
cis_2_2_logging_sink_project_id = "plt-lz-audit01-tf91-prod"
folder_id                       = "450746270117"

gateway_dns = {
  "gcp.osinfra.io" = {
    managed_zone = "gcp-osinfra-io"
    project      = "plt-lz-networking-tfcb-prod"
  }
}
