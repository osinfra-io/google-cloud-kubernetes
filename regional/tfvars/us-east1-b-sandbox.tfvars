enable_gke_hub_host = true

gke_hub_memberships = {
  # "services-us-east4-a" = {
  #   cluster_id = "projects/plt-k8s-tf39-sb/locations/us-east4/clusters/services-us-east4-a"
  # }
}

master_ipv4_cidr_block = "10.63.240.0/28"
node_location          = "us-east1-b"

node_pools = {
  default-pool = {
    machine_type   = "e2-standard-2"
    max_node_count = 1
    min_node_count = 0
  }
}

region              = "us-east1"
remote_bucket       = "plt-k8s-2c8b-sb"
vpc_host_project_id = "plt-lz-networking-tfd8-sb"
zone                = "b"
