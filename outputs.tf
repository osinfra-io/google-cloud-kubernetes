# Output Values
# https://www.terraform.io/language/values/outputs

output "kubernetes_engine_container_deployer_service_accounts" {
  description = "The service accounts for the container deployer"
  value       = module.kubernetes_engine.container_deployer_service_accounts
}

output "kubernetes_engine_workload_identity_service_account_emails" {
  description = "The email addresses of the service accounts for the Kubernetes namespace workload identity"
  value       = module.kubernetes_engine.workload_identity_service_account_emails
}

output "kubernetes_cert_manager_tls_self_signed_cert_cert_manager_root_cert" {
  description = "The self-signed certificate for the cert-manager root certificate"
  value       = module.kubernetes_cert_manager.tls_self_signed_cert_cert_manager_root_cert
}

output "kubernetes_cert_manager_tls_self_signed_cert_cert_manager_root_key" {
  description = "The private key for the cert-manager root certificate"
  value       = module.kubernetes_cert_manager.tls_self_signed_cert_cert_manager_root_key
  sensitive   = true
}

output "kubernetes_istio_gateway_mci_global_address" {
  description = "The IP address for the Istio Gateway multi-cluster ingress"
  value       = module.kubernetes_istio.gateway_mci_global_address
}

output "kubernetes_istio_gateway_mci_ssl_certificate_name" {
  description = "The name of the SSL certificate for the Istio Gateway multi-cluster ingress"
  value       = module.kubernetes_istio.gateway_mci_ssl_certificate_name
}

output "project_id" {
  description = "The project ID"
  value       = module.project.id
}

output "project_number" {
  description = "The project number"
  value       = module.project.number
}
