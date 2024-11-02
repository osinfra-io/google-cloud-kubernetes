kubernetes_engine_enable_gke_hub_host    = true
kubernetes_engine_master_ipv4_cidr_block = "10.63.240.16/28"
kubernetes_engine_node_location          = "us-east1-c"

kubernetes_engine_node_pools = {
  default-pool = {
    machine_type   = "e2-standard-2"
    max_node_count = 1
    min_node_count = 0
  }
}

kubernetes_engine_vpc_host_project_id = "plt-lz-networking-tfd8-sb"
remote_bucket                         = "plt-k8s-2c8b-sb"
