# Terraform Documentation

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_datadog"></a> [datadog](#module\_datadog) | github.com/osinfra-io/terraform-datadog-google-integration//global | v0.1.6 |
| <a name="module_kubernetes_engine_global"></a> [kubernetes\_engine\_global](#module\_kubernetes\_engine\_global) | github.com/osinfra-io/terraform-google-kubernetes-engine//global | istio-remote |
| <a name="module_project"></a> [project](#module\_project) | github.com/osinfra-io/terraform-google-project//global | v0.2.2 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | The alphanumeric ID of the billing account this project belongs to | `string` | `"01C550-A2C86B-B8F16B"` | no |
| <a name="input_cis_2_2_logging_sink_project_id"></a> [cis\_2\_2\_logging\_sink\_project\_id](#input\_cis\_2\_2\_logging\_sink\_project\_id) | The CIS 2.2 logging sink benchmark project ID | `string` | n/a | yes |
| <a name="input_datadog_api_key"></a> [datadog\_api\_key](#input\_datadog\_api\_key) | Datadog API key | `string` | n/a | yes |
| <a name="input_datadog_app_key"></a> [datadog\_app\_key](#input\_datadog\_app\_key) | Datadog APP key | `string` | n/a | yes |
| <a name="input_enable_datadog"></a> [enable\_datadog](#input\_enable\_datadog) | Enable Datadog integration | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment suffix for example: `sb` (Sandbox), `nonprod` (Non-Production), `prod` (Production) | `string` | `"sb"` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | The numeric ID of the folder this project should be created under. Only one of `org_id` or `folder_id` may be specified | `string` | n/a | yes |
| <a name="input_istio_gateway_dns"></a> [istio\_gateway\_dns](#input\_istio\_gateway\_dns) | Map of attributes for the Istio gateway domain names, it is also used to create the managed certificate resource | <pre>map(object({<br>    managed_zone = string<br>    project      = string<br>  }))</pre> | `{}` | no |
| <a name="input_namespaces"></a> [namespaces](#input\_namespaces) | A map of namespaces with the Google service account used for the namespace administrator and whether Istio injection is enabled or disabled | <pre>map(object({<br>    google_service_account = string<br>    istio_injection        = optional(string, "disabled")<br>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_container_deployer_service_accounts"></a> [container\_deployer\_service\_accounts](#output\_container\_deployer\_service\_accounts) | The service accounts for the container deployer |
| <a name="output_istio_gateway_mci_global_address"></a> [istio\_gateway\_mci\_global\_address](#output\_istio\_gateway\_mci\_global\_address) | The IP address for the Istio Gateway multi-cluster ingress |
| <a name="output_istio_gateway_mci_ssl_certificate_name"></a> [istio\_gateway\_mci\_ssl\_certificate\_name](#output\_istio\_gateway\_mci\_ssl\_certificate\_name) | The name of the SSL certificate for the Istio Gateway multi-cluster ingress |
| <a name="output_project_id"></a> [project\_id](#output\_project\_id) | The project ID |
| <a name="output_project_number"></a> [project\_number](#output\_project\_number) | The project number |
| <a name="output_workload_identity_service_account_emails"></a> [workload\_identity\_service\_account\_emails](#output\_workload\_identity\_service\_account\_emails) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
