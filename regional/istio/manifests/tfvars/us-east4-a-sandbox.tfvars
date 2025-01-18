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
  "customer-trust-istio-test-us-east4-a" = {
    destination_host = "istio-test-us-east4-a.customer-trust-istio-test.svc.cluster.local"
    host             = "us-east4-a.sb.customer-trust.osinfra.io"
  }

  "istio-test-us-east4-a" = {
    destination_host = "istio-test-us-east4-a.istio-test.svc.cluster.local"
    host             = "us-east4-a.sb.gcp.osinfra.io"
  }
}

kubernetes_istio_virtual_services = {
  "customer-trust-nginx-us-east4-a" = {
    destination_host = "nginx-us-east4-a.nginx.svc.cluster.local"
    host             = "us-east4-a.sb.customer-trust.osinfra.io"
  }
}
