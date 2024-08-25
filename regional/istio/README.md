# Terraform Documentation

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 5.42.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_kubernetes_istio"></a> [kubernetes\_istio](#module\_kubernetes\_istio) | github.com/osinfra-io/terraform-kubernetes-istio//regional | brettcurtis%2Fissue2 |

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
| <a name="input_istio_control_plane_clusters"></a> [istio\_control\_plane\_clusters](#input\_istio\_control\_plane\_clusters) | The GKE clusters that will be used as Istio control planes | `string` | `null` | no |
| <a name="input_istio_external_istiod"></a> [istio\_external\_istiod](#input\_istio\_external\_istiod) | Boolean to configure a remote cluster data plane controlled by an external istiod | `bool` | `false` | no |
| <a name="input_istio_gateway_cpu_limit"></a> [istio\_gateway\_cpu\_limit](#input\_istio\_gateway\_cpu\_limit) | The CPU limit for the Istio gateway | `string` | `"2000m"` | no |
| <a name="input_istio_gateway_cpu_request"></a> [istio\_gateway\_cpu\_request](#input\_istio\_gateway\_cpu\_request) | The CPU request for the Istio gateway | `string` | `"100m"` | no |
| <a name="input_istio_gateway_dns"></a> [istio\_gateway\_dns](#input\_istio\_gateway\_dns) | Map of attributes for the Istio gateway domain names, it is also used to create the managed certificate resource | <pre>map(object({<br>    managed_zone = string<br>    project      = string<br>  }))</pre> | `{}` | no |
| <a name="input_istio_gateway_memory_limit"></a> [istio\_gateway\_memory\_limit](#input\_istio\_gateway\_memory\_limit) | The memory limit for the Istio gateway | `string` | `"1024Mi"` | no |
| <a name="input_istio_gateway_memory_request"></a> [istio\_gateway\_memory\_request](#input\_istio\_gateway\_memory\_request) | The memory request for the Istio gateway | `string` | `"128Mi"` | no |
| <a name="input_istio_pilot_autoscale_min"></a> [istio\_pilot\_autoscale\_min](#input\_istio\_pilot\_autoscale\_min) | The minimum number of Istio pilot replicas to run | `number` | `1` | no |
| <a name="input_istio_pilot_cpu_limit"></a> [istio\_pilot\_cpu\_limit](#input\_istio\_pilot\_cpu\_limit) | The CPU limit for the Istio pilot | `string` | `"1000m"` | no |
| <a name="input_istio_pilot_cpu_request"></a> [istio\_pilot\_cpu\_request](#input\_istio\_pilot\_cpu\_request) | The CPU request for the Istio pilot | `string` | `"500m"` | no |
| <a name="input_istio_pilot_memory_limit"></a> [istio\_pilot\_memory\_limit](#input\_istio\_pilot\_memory\_limit) | The memory limit for the Istio pilot | `string` | `"4096Mi"` | no |
| <a name="input_istio_pilot_memory_request"></a> [istio\_pilot\_memory\_request](#input\_istio\_pilot\_memory\_request) | The memory request for the Istio pilot | `string` | `"2048Mi"` | no |
| <a name="input_istio_pilot_replica_count"></a> [istio\_pilot\_replica\_count](#input\_istio\_pilot\_replica\_count) | The number of Istio pilot replicas to run | `number` | `1` | no |
| <a name="input_istio_proxy_cpu_limit"></a> [istio\_proxy\_cpu\_limit](#input\_istio\_proxy\_cpu\_limit) | The CPU limit for the Istio proxy | `string` | `"2000m"` | no |
| <a name="input_istio_proxy_cpu_request"></a> [istio\_proxy\_cpu\_request](#input\_istio\_proxy\_cpu\_request) | The CPU request for the Istio proxy | `string` | `"100m"` | no |
| <a name="input_istio_proxy_memory_limit"></a> [istio\_proxy\_memory\_limit](#input\_istio\_proxy\_memory\_limit) | The memory limit for the Istio proxy | `string` | `"1024Mi"` | no |
| <a name="input_istio_proxy_memory_request"></a> [istio\_proxy\_memory\_request](#input\_istio\_proxy\_memory\_request) | The memory request for the Istio proxy | `string` | `"128Mi"` | no |
| <a name="input_istio_remote_injection_path"></a> [istio\_remote\_injection\_path](#input\_istio\_remote\_injection\_path) | The sidecar injector mutating webhook configuration path value for the clientConfig.service field | `string` | `"/inject"` | no |
| <a name="input_istio_remote_injection_url"></a> [istio\_remote\_injection\_url](#input\_istio\_remote\_injection\_url) | The sidecar injector mutating webhook configuration clientConfig.url value | `string` | `""` | no |
| <a name="input_istiod_injection_path"></a> [istiod\_injection\_path](#input\_istiod\_injection\_path) | The sidecar injector mutating webhook configuration path value for the clientConfig.service field | `string` | `"/inject"` | no |
| <a name="input_istiod_injection_url"></a> [istiod\_injection\_url](#input\_istiod\_injection\_url) | The sidecar injector mutating webhook configuration clientConfig.url value | `string` | `""` | no |
| <a name="input_region"></a> [region](#input\_region) | The region to deploy the resources to | `string` | n/a | yes |
| <a name="input_remote_bucket"></a> [remote\_bucket](#input\_remote\_bucket) | The remote bucket the `terraform_remote_state` data source retrieves the state from | `string` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | The zone to deploy the resources to | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
