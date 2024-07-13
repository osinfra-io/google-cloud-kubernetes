istio_external_istiod = true
region                = "us-east4"
remote_bucket         = "plt-k8s-2c8b-sb"
zone                  = "a"

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
  "customer-trust-nginx-us-east4-a" = {
    destination_host = "nginx-us-east4-a.nginx.svc.cluster.local"
    host             = "us-east4-a.sb.customer-trust.osinfra.io"
  }
}

gke_info_istio_virtual_services = {
  "gke-info-go-us-east4-a" = {
    destination_host = "gke-info-go-us-east4-a.gke-info.svc.cluster.local"
    host             = "us-east4-a.sb.gcp.osinfra.io"
  }

  "customer-trust-gke-info-us-east4-a" = {
    destination_host = "gke-info-go-us-east4-a.customer-trust-gke-info.svc.cluster.local"
    host             = "us-east4-a.sb.customer-trust.osinfra.io"
  }
}
