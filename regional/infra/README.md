# Terraform Regional Infrastructure Documentation

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_kubernetes"></a> [kubernetes](#module\_kubernetes) | github.com/osinfra-io/terraform-google-kubernetes-engine//regional/infra | n/a |

## Resources

| Name | Type |
|------|------|
| [terraform_remote_state.global](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_cluster"></a> [enable\_cluster](#input\_enable\_cluster) | Enable the creation of the GKE cluster | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment for example: `sandbox`, `non-production`, `production` | `string` | `"sandbox"` | no |
| <a name="input_host_project_id"></a> [host\_project\_id](#input\_host\_project\_id) | Host project for the shared VPC | `string` | n/a | yes |
| <a name="input_master_ipv4_cidr_block"></a> [master\_ipv4\_cidr\_block](#input\_master\_ipv4\_cidr\_block) | The IP range in CIDR notation to use for the hosted master network | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The region to deploy the resources to | `string` | n/a | yes |
| <a name="input_remote_bucket"></a> [remote\_bucket](#input\_remote\_bucket) | The remote bucket the `terraform_remote_state` data source retrieves the state from | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_container_cluster_ca_certificate"></a> [container\_cluster\_ca\_certificate](#output\_container\_cluster\_ca\_certificate) | Base64 encoded public certificate that is the root of trust for the cluster |
| <a name="output_container_cluster_endpoint"></a> [container\_cluster\_endpoint](#output\_container\_cluster\_endpoint) | The connection endpoint for the cluster |
| <a name="output_project_id"></a> [project\_id](#output\_project\_id) | The project ID |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
