# Terraform Documentation

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 6.18.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_helpers"></a> [helpers](#module\_helpers) | github.com/osinfra-io/terraform-core-helpers//root | v0.1.2 |
| <a name="module_kubernetes_istio_manifests"></a> [kubernetes\_istio\_manifests](#module\_kubernetes\_istio\_manifests) | github.com/osinfra-io/terraform-kubernetes-istio//regional/manifests | ecdsa |

## Resources

| Name | Type |
|------|------|
| [google_client_config.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config) | data source |
| [google_container_cluster.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/container_cluster) | data source |
| [google_project.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project) | data source |
| [google_projects.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/projects) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_kubernetes_istio_common_istio_test_virtual_services"></a> [kubernetes\_istio\_common\_istio\_test\_virtual\_services](#input\_kubernetes\_istio\_common\_istio\_test\_virtual\_services) | The map of Istio VirtualServices to create for Istio testing, that are common among all regions | <pre>map(object({<br/>    destination_host = string<br/>    host             = string<br/>  }))</pre> | n/a | yes |
| <a name="input_kubernetes_istio_common_virtual_services"></a> [kubernetes\_istio\_common\_virtual\_services](#input\_kubernetes\_istio\_common\_virtual\_services) | The map of Istio VirtualServices to create, that are common among all regions | <pre>map(object({<br/>    destination_host = string<br/>    destination_port = optional(number, 8080)<br/>    host             = string<br/>  }))</pre> | `{}` | no |
| <a name="input_kubernetes_istio_failover_from_region"></a> [kubernetes\_istio\_failover\_from\_region](#input\_kubernetes\_istio\_failover\_from\_region) | The region to fail over from | `string` | `""` | no |
| <a name="input_kubernetes_istio_failover_to_region"></a> [kubernetes\_istio\_failover\_to\_region](#input\_kubernetes\_istio\_failover\_to\_region) | The region to fail over to | `string` | `""` | no |
| <a name="input_kubernetes_istio_test_virtual_services"></a> [kubernetes\_istio\_test\_virtual\_services](#input\_kubernetes\_istio\_test\_virtual\_services) | The map of Istio VirtualServices to create for Istio testing | <pre>map(object({<br/>    destination_host = string<br/>    host             = string<br/>  }))</pre> | n/a | yes |
| <a name="input_kubernetes_istio_virtual_services"></a> [kubernetes\_istio\_virtual\_services](#input\_kubernetes\_istio\_virtual\_services) | The map of Istio VirtualServices to create, that are unique to a region | <pre>map(object({<br/>    destination_host = string<br/>    destination_port = optional(number, 8080)<br/>    host             = string<br/>  }))</pre> | `{}` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
