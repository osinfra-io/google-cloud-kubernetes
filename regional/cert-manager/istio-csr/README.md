# Terraform Documentation

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 6.4.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_kubernetes_cert_manager_istio_csr"></a> [kubernetes\_cert\_manager\_istio\_csr](#module\_kubernetes\_cert\_manager\_istio\_csr) | github.com/osinfra-io/terraform-kubernetes-cert-manager//regional/istio-csr | dev |

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
| <a name="input_region"></a> [region](#input\_region) | The region to deploy the resources to | `string` | n/a | yes |
| <a name="input_remote_bucket"></a> [remote\_bucket](#input\_remote\_bucket) | The remote bucket the `terraform_remote_state` data source retrieves the state from | `string` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | The zone to deploy the resources to | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->