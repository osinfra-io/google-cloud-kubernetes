kubernetes_istio_common_istio_test_virtual_services = {
  "istio-test" = {
    destination_host = "istio-test.istio-test.svc.cluster.local"
    host             = "sb.gcp.osinfra.io"
  }
}

kubernetes_istio_failover_from_region = "us-east4"
kubernetes_istio_failover_to_region   = "us-east1"

kubernetes_istio_test_virtual_services = {
  "istio-test-us-east4-a" = {
    destination_host = "istio-test-us-east4-a.istio-test.svc.cluster.local"
    host             = "us-east4-a.sb.gcp.osinfra.io"
  }
}
