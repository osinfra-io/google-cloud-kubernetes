# <img align="left" width="45" height="45" src="https://github.com/osinfra-io/google-cloud-kubernetes/assets/1610100/9a2afb97-282d-4050-83c5-2e41925e4dc6"> Google Cloud Platform - Kubernetes

**[GitHub Actions](https://github.com/osinfra-io/google-cloud-kubernetes/actions):**

[![Dependabot](https://github.com/osinfra-io/google-cloud-kubernetes/actions/workflows/dependabot.yml/badge.svg)](https://github.com/osinfra-io/google-cloud-kubernetes/actions/workflows/dependabot.yml)

**[Infracost](https://www.infracost.io):**

[![infracost](https://img.shields.io/endpoint?url=https://dashboard.api.infracost.io/shields/json/cbeecfe3-576f-4553-984c-e451a575ee47/repos/19dee006-53a6-4007-be23-d2e44617e789/branch/95a827e0-1914-470d-8faf-78413ec29595)](https://dashboard.infracost.io/org/osinfra-io/repos/19dee006-53a6-4007-be23-d2e44617e789?tab=settings)

## 📄 Repository Description

This repository manages Kubernetes resources.

## 🏭 Platform Information

- Documentation: [docs.osinfra.io](https://docs.osinfra.io/product-guides/google-cloud-platform/kubernetes)
- Service Interfaces: [github.com](https://github.com/osinfra-io/google-cloud-kubernetes/issues/new/choose)

## <img align="left" width="35" height="35" src="https://github.com/osinfra-io/github-organization-management/assets/1610100/39d6ae3b-ccc2-42db-92f1-276a5bc54e65"> Development

Our focus is on the core fundamental practice of platform engineering, Infrastructure as Code.

>Open Source Infrastructure (as Code) is a development model for infrastructure that focuses on open collaboration and applying relative lessons learned from software development practices that organizations can use internally at scale. - [Open Source Infrastructure (as Code)](https://www.osinfra.io)

To avoid slowing down stream-aligned teams, we want to open up the possibility for contributions. The Open Source Infrastructure (as Code) model allows team members external to the platform team to contribute with only a slight increase in cognitive load. This section is for developers who want to contribute to this repository, describing the tools used, the skills, and the knowledge required, along with Terraform documentation.

See the documentation for setting up a development environment [here](https://docs.osinfra.io/fundamentals/development-setup).

### 🛠️ Tools

- [infracost](https://github.com/infracost/infracost)
- [pre-commit](https://github.com/pre-commit/pre-commit)
- [pre-commit-terraform](https://github.com/antonbabenko/pre-commit-terraform)
- [terraform-docs](https://github.com/terraform-docs/terraform-docs)

### 📋 Skills and Knowledge

Links to documentation and other resources required to develop and iterate in this repository successfully.

- [kubernetes](https://kubernetes.io/docs/home)

### 📓 Terraform Documentation

<!-- BEGIN_TF_DOCS -->
#### Requirements

No requirements.

#### Providers

No providers.

#### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_datadog"></a> [datadog](#module\_datadog) | github.com/osinfra-io/terraform-datadog-google-integration | v0.3.0 |
| <a name="module_kubernetes_engine"></a> [kubernetes\_engine](#module\_kubernetes\_engine) | github.com/osinfra-io/terraform-google-kubernetes-engine | main |
| <a name="module_kubernetes_istio"></a> [kubernetes\_istio](#module\_kubernetes\_istio) | github.com/osinfra-io/terraform-kubernetes-istio | main |
| <a name="module_project"></a> [project](#module\_project) | github.com/osinfra-io/terraform-google-project | v0.4.0 |

#### Resources

No resources.

#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_datadog_api_key"></a> [datadog\_api\_key](#input\_datadog\_api\_key) | Datadog API key | `string` | n/a | yes |
| <a name="input_datadog_app_key"></a> [datadog\_app\_key](#input\_datadog\_app\_key) | Datadog APP key | `string` | n/a | yes |
| <a name="input_datadog_enable"></a> [datadog\_enable](#input\_datadog\_enable) | Enable Datadog integration | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment for example: `sandbox`, `non-production`, `production` | `string` | `"sandbox"` | no |
| <a name="input_kubernetes_engine_namespaces"></a> [kubernetes\_engine\_namespaces](#input\_kubernetes\_engine\_namespaces) | A map of namespaces with the Google service account used for the namespace administrator and whether Istio injection is enabled or disabled | <pre>map(object({<br>    google_service_account = string<br>    istio_injection        = optional(string, "disabled")<br>  }))</pre> | `{}` | no |
| <a name="input_kubernetes_istio_gateway_dns"></a> [kubernetes\_istio\_gateway\_dns](#input\_kubernetes\_istio\_gateway\_dns) | Map of attributes for the Istio gateway domain names, it is also used to create the managed certificate resource | <pre>map(object({<br>    managed_zone = string<br>    project      = string<br>  }))</pre> | `{}` | no |
| <a name="input_project_billing_account"></a> [project\_billing\_account](#input\_project\_billing\_account) | The alphanumeric ID of the billing account this project belongs to | `string` | `"01C550-A2C86B-B8F16B"` | no |
| <a name="input_project_cis_2_2_logging_sink_project_id"></a> [project\_cis\_2\_2\_logging\_sink\_project\_id](#input\_project\_cis\_2\_2\_logging\_sink\_project\_id) | The CIS 2.2 logging sink benchmark project ID | `string` | n/a | yes |
| <a name="input_project_folder_id"></a> [project\_folder\_id](#input\_project\_folder\_id) | The numeric ID of the folder this project should be created under. Only one of `org_id` or `folder_id` may be specified | `string` | n/a | yes |
| <a name="input_project_monthly_budget_amount"></a> [project\_monthly\_budget\_amount](#input\_project\_monthly\_budget\_amount) | The monthly budget amount in USD to set for the project | `number` | `5` | no |

#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_kubernetes_engine_container_deployer_service_accounts"></a> [kubernetes\_engine\_container\_deployer\_service\_accounts](#output\_kubernetes\_engine\_container\_deployer\_service\_accounts) | The service accounts for the container deployer |
| <a name="output_kubernetes_engine_workload_identity_service_account_emails"></a> [kubernetes\_engine\_workload\_identity\_service\_account\_emails](#output\_kubernetes\_engine\_workload\_identity\_service\_account\_emails) | The email addresses of the service accounts for the Kubernetes namespace workload identity |
| <a name="output_kubernetes_istio_gateway_mci_global_address"></a> [kubernetes\_istio\_gateway\_mci\_global\_address](#output\_kubernetes\_istio\_gateway\_mci\_global\_address) | The IP address for the Istio Gateway multi-cluster ingress |
| <a name="output_kubernetes_istio_gateway_mci_ssl_certificate_name"></a> [kubernetes\_istio\_gateway\_mci\_ssl\_certificate\_name](#output\_kubernetes\_istio\_gateway\_mci\_ssl\_certificate\_name) | The name of the SSL certificate for the Istio Gateway multi-cluster ingress |
| <a name="output_project_id"></a> [project\_id](#output\_project\_id) | The project ID |
| <a name="output_project_number"></a> [project\_number](#output\_project\_number) | The project number |
<!-- END_TF_DOCS -->

### 📓 Terraform Regional Documentation

- [regional](regional/README.md)
- [regional/istio](regional/istio/README.md)
- [regional/mci](regional/mci/README.md)
- [regional/onboarding](regional/onboarding/README.md)
