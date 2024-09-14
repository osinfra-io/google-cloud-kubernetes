environment                     = "non-production"
cis_2_2_logging_sink_project_id = "plt-lz-audit01-tff4-nonprod"
folder_id                       = "308872035878"

gateway_dns = {
  "nonprod.gcp.osinfra.io" = {
    managed_zone = "nonprod-gcp-osinfra-io"
    project      = "plt-lz-networking-tf81-nonprod"
  }
}
