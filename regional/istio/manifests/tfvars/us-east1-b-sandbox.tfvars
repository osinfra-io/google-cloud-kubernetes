kubernetes_istio_common_istio_test_virtual_services = {
  "istio-test" = {
    destination_host = "istio-test.istio-test.svc.cluster.local"
    host             = "sb.gcp.osinfra.io"
  }
}

kubernetes_istio_failover_from_region = "us-east1"
kubernetes_istio_failover_to_region   = "us-east4"

kubernetes_istio_test_virtual_services = {
  "istio-test-us-east1-b" = {
    destination_host = "istio-test-us-east1-b.istio-test.svc.cluster.local"
    host             = "us-east1-b.sb.gcp.osinfra.io"
  }
}
