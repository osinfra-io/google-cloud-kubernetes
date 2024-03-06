environment                     = "prod"
cis_2_2_logging_sink_project_id = "plt-lz-audit01-tf91-prod"
folder_id                       = "450746270117"

istio_gateway_ssl = [
  # Common Name:
  "gateway.gcp.osinfra.io",

  # Subject Alternative Names:
  "stream-team.gcp.osinfra.io"
]
