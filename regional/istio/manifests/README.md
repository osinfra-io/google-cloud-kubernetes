# Terraform Documentation

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 6.3.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_kubernetes_istio_manifests"></a> [kubernetes\_istio\_manifests](#module\_kubernetes\_istio\_manifests) | github.com/osinfra-io/terraform-kubernetes-istio//regional/manifests | main |

## Resources

| Name | Type |
|------|------|
| [google_client_config.current](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config) | data source |
| [terraform_remote_state.regional](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | The environment for example: `sandbox`, `non-production`, `production` | `string` | `"sandbox"` | no |
| <a name="input_kubernetes_istio_common_gke_info_virtual_services"></a> [kubernetes\_istio\_common\_gke\_info\_virtual\_services](#input\_kubernetes\_istio\_common\_gke\_info\_virtual\_services) | The map of Istio VirtualServices to create for GKE Info, that are common among all regions | <pre>map(object({<br/>    destination_host = string<br/>    host             = string<br/>  }))</pre> | n/a | yes |
| <a name="input_kubernetes_istio_common_virtual_services"></a> [kubernetes\_istio\_common\_virtual\_services](#input\_kubernetes\_istio\_common\_virtual\_services) | The map of Istio VirtualServices to create, that are common among all regions | <pre>map(object({<br/>    destination_host = string<br/>    destination_port = optional(number, 8080)<br/>    host             = string<br/>  }))</pre> | n/a | yes |
| <a name="input_kubernetes_istio_failover_from_region"></a> [kubernetes\_istio\_failover\_from\_region](#input\_kubernetes\_istio\_failover\_from\_region) | The region to fail over from | `string` | `""` | no |
| <a name="input_kubernetes_istio_failover_to_region"></a> [kubernetes\_istio\_failover\_to\_region](#input\_kubernetes\_istio\_failover\_to\_region) | The region to fail over to | `string` | `""` | no |
| <a name="input_kubernetes_istio_gke_info_virtual_services"></a> [kubernetes\_istio\_gke\_info\_virtual\_services](#input\_kubernetes\_istio\_gke\_info\_virtual\_services) | The map of Istio VirtualServices to create for GKE Info | <pre>map(object({<br/>    destination_host = string<br/>    host             = string<br/>  }))</pre> | n/a | yes |
| <a name="input_kubernetes_istio_virtual_services"></a> [kubernetes\_istio\_virtual\_services](#input\_kubernetes\_istio\_virtual\_services) | The map of Istio VirtualServices to create, that are unique to a region | <pre>map(object({<br/>    destination_host = string<br/>    destination_port = optional(number, 8080)<br/>    host             = string<br/>  }))</pre> | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The region to deploy the resources to | `string` | n/a | yes |
| <a name="input_remote_bucket"></a> [remote\_bucket](#input\_remote\_bucket) | The remote bucket the `terraform_remote_state` data source retrieves the state from | `string` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | The zone to deploy the resources to | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
