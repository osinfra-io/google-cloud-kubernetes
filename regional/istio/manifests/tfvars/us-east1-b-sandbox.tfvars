region        = "us-east1"
remote_bucket = "plt-k8s-2c8b-sb"
zone          = "b"

common_istio_virtual_services = {
  "customer-trust-nginx" = {
    destination_host = "nginx.nginx.svc.cluster.local"
    host             = "sb.customer-trust.osinfra.io"
  }
}

common_gke_info_istio_virtual_services = {
  "customer-trust-gke-info" = {
    destination_host = "gke-info-go.customer-trust-gke-info.svc.cluster.local"
    host             = "sb.customer-trust.osinfra.io"
  }

  "gke-info-go" = {
    destination_host = "gke-info-go.gke-info.svc.cluster.local"
    host             = "sb.gcp.osinfra.io"
  }
}

istio_failover_from_region = "us-east1"
istio_failover_to_region   = "us-east4"

istio_virtual_services = {
  "customer-trust-nginx-us-east1-b" = {
    destination_host = "nginx-us-east1-b.nginx.svc.cluster.local"
    host             = "us-east1-b.sb.customer-trust.osinfra.io"
  }
}

gke_info_istio_virtual_services = {
  "gke-info-go-us-east1-b" = {
    destination_host = "gke-info-go-us-east1-b.gke-info.svc.cluster.local"
    host             = "us-east1-b.sb.gcp.osinfra.io"
  }

  "customer-trust-gke-info-us-east1-b" = {
    destination_host = "gke-info-go-us-east1-b.customer-trust-gke-info.svc.cluster.local"
    host             = "us-east1-b.sb.customer-trust.osinfra.io"
  }
}
