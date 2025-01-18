kubernetes_istio_common_istio_test_virtual_services = {
  "customer-trust-istio-test" = {
    destination_host = "istio-test.customer-trust-istio-test.svc.cluster.local"
    host             = "sb.customer-trust.osinfra.io"
  }

  "istio-test" = {
    destination_host = "istio-test.istio-test.svc.cluster.local"
    host             = "sb.gcp.osinfra.io"
  }
}

kubernetes_istio_common_virtual_services = {
  "customer-trust-nginx" = {
    destination_host = "nginx.nginx.svc.cluster.local"
    host             = "sb.customer-trust.osinfra.io"
  }
}

kubernetes_istio_failover_from_region = "us-east1"
kubernetes_istio_failover_to_region   = "us-east4"

kubernetes_istio_test_virtual_services = {
  "customer-trust-istio-test-us-east1-b" = {
    destination_host = "istio-test-us-east1-b.customer-trust-istio-test.svc.cluster.local"
    host             = "us-east1-b.sb.customer-trust.osinfra.io"
  }

  "istio-test-us-east1-b" = {
    destination_host = "istio-test-us-east1-b.istio-test.svc.cluster.local"
    host             = "us-east1-b.sb.gcp.osinfra.io"
  }
}

kubernetes_istio_virtual_services = {
  "customer-trust-nginx-us-east1-b" = {
    destination_host = "nginx-us-east1-b.nginx.svc.cluster.local"
    host             = "us-east1-b.sb.customer-trust.osinfra.io"
  }
}
