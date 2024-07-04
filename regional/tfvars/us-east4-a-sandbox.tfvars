master_ipv4_cidr_block = "10.63.240.48/28"
node_location          = "us-east4-a"

node_pools = {
  default-pool = {
    machine_type   = "e2-standard-2"
    max_node_count = 1
    min_node_count = 0
  }
}

region              = "us-east4"
remote_bucket       = "plt-k8s-2c8b-sb"
vpc_host_project_id = "plt-lz-networking-tfd8-sb"
zone                = "a"
