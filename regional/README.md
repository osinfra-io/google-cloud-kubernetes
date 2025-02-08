# Terraform Documentation

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_helpers"></a> [helpers](#module\_helpers) | github.com/osinfra-io/terraform-core-helpers//root | v0.1.2 |
| <a name="module_kubernetes_engine_regional"></a> [kubernetes\_engine\_regional](#module\_kubernetes\_engine\_regional) | github.com/osinfra-io/terraform-google-kubernetes-engine//regional | v0.2.3 |

## Resources

| Name | Type |
|------|------|
| [terraform_remote_state.main](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_kubernetes_engine_enable_gke_hub_host"></a> [kubernetes\_engine\_enable\_gke\_hub\_host](#input\_kubernetes\_engine\_enable\_gke\_hub\_host) | Whether or not to enable GKE Hub Host | `bool` | `false` | no |
| <a name="input_kubernetes_engine_gke_hub_memberships"></a> [kubernetes\_engine\_gke\_hub\_memberships](#input\_kubernetes\_engine\_gke\_hub\_memberships) | The map of GKE Hub Memberships to create | <pre>map(object({<br/>    cluster_id = string<br/>  }))</pre> | `{}` | no |
| <a name="input_kubernetes_engine_master_ipv4_cidr_block"></a> [kubernetes\_engine\_master\_ipv4\_cidr\_block](#input\_kubernetes\_engine\_master\_ipv4\_cidr\_block) | The IP range in CIDR notation to use for the hosted master network | `string` | n/a | yes |
| <a name="input_kubernetes_engine_node_location"></a> [kubernetes\_engine\_node\_location](#input\_kubernetes\_engine\_node\_location) | The zone to deploy the nodes to | `string` | n/a | yes |
| <a name="input_kubernetes_engine_node_pools"></a> [kubernetes\_engine\_node\_pools](#input\_kubernetes\_engine\_node\_pools) | The node pools to create in the cluster | <pre>map(object({<br/>    auto_repair                              = optional(bool)<br/>    auto_upgrade                             = optional(bool)<br/>    disk_size_gb                             = optional(number)<br/>    disk_type                                = optional(string)<br/>    image_type                               = optional(string)<br/>    machine_type                             = optional(string)<br/>    max_node_count                           = optional(number, 3)<br/>    min_node_count                           = optional(number, 1)<br/>    node_count                               = optional(number)<br/>    oauth_scopes                             = optional(list(string), ["https://www.googleapis.com/auth/cloud-platform"])<br/>    upgrade_settings_batch_node_count        = optional(number)<br/>    upgrade_settings_batch_percentage        = optional(number)<br/>    upgrade_settings_batch_soak_duration     = optional(string)<br/>    upgrade_settings_node_pool_soak_duration = optional(string)<br/>    upgrade_settings_max_surge               = optional(number)<br/>    upgrade_settings_max_unavailable         = optional(number, 1) # https://github.com/hashicorp/terraform-provider-google/issues/17164<br/>    upgrade_settings_strategy                = optional(string, "SURGE")<br/>  }))</pre> | <pre>{<br/>  "default-pool": {<br/>    "machine_type": "n2-standard-2"<br/>  }<br/>}</pre> | no |
| <a name="input_kubernetes_engine_vpc_host_project_id"></a> [kubernetes\_engine\_vpc\_host\_project\_id](#input\_kubernetes\_engine\_vpc\_host\_project\_id) | Host project for the shared VPC | `string` | n/a | yes |
| <a name="input_remote_bucket"></a> [remote\_bucket](#input\_remote\_bucket) | The remote bucket the `terraform_remote_state` data source retrieves the state from | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kubernetes_engine_service_account_gke_operations_email"></a> [kubernetes\_engine\_service\_account\_gke\_operations\_email](#output\_kubernetes\_engine\_service\_account\_gke\_operations\_email) | The email address of the Kubernetes minimum privilege service account for the cluster |
<!-- END_TF_DOCS -->
