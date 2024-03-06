environment                     = "nonprod"
cis_2_2_logging_sink_project_id = "plt-lz-audit01-tff4-nonprod"
folder_id                       = "308872035878"

istio_gateway_ssl = [
  # Common Name:
  "gateway.nonprod.gcp.osinfra.io",

  # Subject Alternative Names:
  "stream-team.nonprod.gcp.osinfra.io"
]
