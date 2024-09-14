# Output Values
# https://www.terraform.io/language/values/outputs

output "container_deployer_service_accounts" {
  description = "The service accounts for the container deployer"
  value       = module.kubernetes_engine.container_deployer_service_accounts
}

output "gateway_mci_global_address" {
  description = "The IP address for the Istio Gateway multi-cluster ingress"
  value       = module.kubernetes_istio.gateway_mci_global_address
}

output "istio_gateway_mci_ssl_certificate_name" {
  description = "The name of the SSL certificate for the Istio Gateway multi-cluster ingress"
  value       = module.kubernetes_istio.istio_gateway_mci_ssl_certificate_name
}

output "project_id" {
  description = "The project ID"
  value       = module.project.project_id
}

output "project_number" {
  description = "The project number"
  value       = module.project.project_number
}

output "workload_identity_service_account_emails" {
  value = module.kubernetes_engine.workload_identity_service_account_emails
}
