# Terraform Documentation

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 6.0.1 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_kubernetes_istio_manifests"></a> [kubernetes\_istio\_manifests](#module\_kubernetes\_istio\_manifests) | github.com/osinfra-io/terraform-kubernetes-istio//regional/manifests | auth |

## Resources

| Name | Type |
|------|------|
| [google_client_config.current](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config) | data source |
| [terraform_remote_state.regional](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_common_gke_info_istio_virtual_services"></a> [common\_gke\_info\_istio\_virtual\_services](#input\_common\_gke\_info\_istio\_virtual\_services) | The map of Istio VirtualServices to create for GKE Info, that are common among all regions | <pre>map(object({<br>    destination_host = string<br>    host             = string<br>  }))</pre> | n/a | yes |
| <a name="input_common_istio_virtual_services"></a> [common\_istio\_virtual\_services](#input\_common\_istio\_virtual\_services) | The map of Istio VirtualServices to create, that are common among all regions | <pre>map(object({<br>    destination_host = string<br>    destination_port = optional(number, 8080)<br>    host             = string<br>  }))</pre> | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment for example: `sandbox`, `non-production`, `production` | `string` | `"sandbox"` | no |
| <a name="input_gke_info_istio_virtual_services"></a> [gke\_info\_istio\_virtual\_services](#input\_gke\_info\_istio\_virtual\_services) | The map of Istio VirtualServices to create for GKE Info | <pre>map(object({<br>    destination_host = string<br>    host             = string<br>  }))</pre> | n/a | yes |
| <a name="input_istio_failover_from_region"></a> [istio\_failover\_from\_region](#input\_istio\_failover\_from\_region) | The region to fail over from | `string` | `""` | no |
| <a name="input_istio_failover_to_region"></a> [istio\_failover\_to\_region](#input\_istio\_failover\_to\_region) | The region to fail over to | `string` | `""` | no |
| <a name="input_istio_virtual_services"></a> [istio\_virtual\_services](#input\_istio\_virtual\_services) | The map of Istio VirtualServices to create, that are unique to a region | <pre>map(object({<br>    destination_host = string<br>    destination_port = optional(number, 8080)<br>    host             = string<br>  }))</pre> | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The region to deploy the resources to | `string` | n/a | yes |
| <a name="input_remote_bucket"></a> [remote\_bucket](#input\_remote\_bucket) | The remote bucket the `terraform_remote_state` data source retrieves the state from | `string` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | The zone to deploy the resources to | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
