# Terraform Documentation

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 6.2.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_kubernetes_istio"></a> [kubernetes\_istio](#module\_kubernetes\_istio) | github.com/osinfra-io/terraform-kubernetes-istio//regional | main |

## Resources

| Name | Type |
|------|------|
| [google_client_config.current](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config) | data source |
| [terraform_remote_state.main](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.regional](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | The environment for example: `sandbox`, `non-production`, `production` | `string` | `"sandbox"` | no |
| <a name="input_kubernetes_istio_gateway_cpu_limits"></a> [kubernetes\_istio\_gateway\_cpu\_limits](#input\_kubernetes\_istio\_gateway\_cpu\_limits) | The CPU limit for the Istio gateway | `string` | `"100m"` | no |
| <a name="input_kubernetes_istio_gateway_cpu_requests"></a> [kubernetes\_istio\_gateway\_cpu\_requests](#input\_kubernetes\_istio\_gateway\_cpu\_requests) | The CPU request for the Istio gateway | `string` | `"25m"` | no |
| <a name="input_kubernetes_istio_gateway_dns"></a> [kubernetes\_istio\_gateway\_dns](#input\_kubernetes\_istio\_gateway\_dns) | Map of attributes for the Istio gateway domain names, it is also used to create the managed certificate resource | <pre>map(object({<br>    managed_zone = string<br>    project      = string<br>  }))</pre> | `{}` | no |
| <a name="input_kubernetes_istio_gateway_memory_limits"></a> [kubernetes\_istio\_gateway\_memory\_limits](#input\_kubernetes\_istio\_gateway\_memory\_limits) | The memory limit for the Istio gateway | `string` | `"64Mi"` | no |
| <a name="input_kubernetes_istio_gateway_memory_requests"></a> [kubernetes\_istio\_gateway\_memory\_requests](#input\_kubernetes\_istio\_gateway\_memory\_requests) | The memory request for the Istio gateway | `string` | `"32Mi"` | no |
| <a name="input_kubernetes_istio_pilot_autoscale_min"></a> [kubernetes\_istio\_pilot\_autoscale\_min](#input\_kubernetes\_istio\_pilot\_autoscale\_min) | The minimum number of Istio pilot replicas to run | `number` | `1` | no |
| <a name="input_kubernetes_istio_pilot_cpu_limits"></a> [kubernetes\_istio\_pilot\_cpu\_limits](#input\_kubernetes\_istio\_pilot\_cpu\_limits) | The CPU limit for the Istio pilot | `string` | `"25m"` | no |
| <a name="input_kubernetes_istio_pilot_cpu_requests"></a> [kubernetes\_istio\_pilot\_cpu\_requests](#input\_kubernetes\_istio\_pilot\_cpu\_requests) | The CPU request for the Istio pilot | `string` | `"10m"` | no |
| <a name="input_kubernetes_istio_pilot_memory_limits"></a> [kubernetes\_istio\_pilot\_memory\_limits](#input\_kubernetes\_istio\_pilot\_memory\_limits) | The memory limit for the Istio pilot | `string` | `"64Mi"` | no |
| <a name="input_kubernetes_istio_pilot_memory_requests"></a> [kubernetes\_istio\_pilot\_memory\_requests](#input\_kubernetes\_istio\_pilot\_memory\_requests) | The memory request for the Istio pilot | `string` | `"32Mi"` | no |
| <a name="input_kubernetes_istio_pilot_replica_count"></a> [kubernetes\_istio\_pilot\_replica\_count](#input\_kubernetes\_istio\_pilot\_replica\_count) | The number of Istio pilot replicas to run | `number` | `1` | no |
| <a name="input_kubernetes_istio_proxy_cpu_limits"></a> [kubernetes\_istio\_proxy\_cpu\_limits](#input\_kubernetes\_istio\_proxy\_cpu\_limits) | The CPU limit for the Istio proxy | `string` | `"25m"` | no |
| <a name="input_kubernetes_istio_proxy_cpu_requests"></a> [kubernetes\_istio\_proxy\_cpu\_requests](#input\_kubernetes\_istio\_proxy\_cpu\_requests) | The CPU request for the Istio proxy | `string` | `"10m"` | no |
| <a name="input_kubernetes_istio_proxy_memory_limits"></a> [kubernetes\_istio\_proxy\_memory\_limits](#input\_kubernetes\_istio\_proxy\_memory\_limits) | The memory limit for the Istio proxy | `string` | `"64Mi"` | no |
| <a name="input_kubernetes_istio_proxy_memory_requests"></a> [kubernetes\_istio\_proxy\_memory\_requests](#input\_kubernetes\_istio\_proxy\_memory\_requests) | The memory request for the Istio proxy | `string` | `"32Mi"` | no |
| <a name="input_region"></a> [region](#input\_region) | The region to deploy the resources to | `string` | n/a | yes |
| <a name="input_remote_bucket"></a> [remote\_bucket](#input\_remote\_bucket) | The remote bucket the `terraform_remote_state` data source retrieves the state from | `string` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | The zone to deploy the resources to | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
