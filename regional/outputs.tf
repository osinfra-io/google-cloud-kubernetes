# Output Values
# https://www.terraform.io/language/values/outputs

output "container_cluster_ca_certificate" {
  description = "Base64 encoded public certificate that is the root of trust for the cluster"
  sensitive   = true
  value       = module.kubernetes_engine_regional.container_cluster_ca_certificate
}

output "container_cluster_endpoint" {
  description = "The connection endpoint for the cluster"
  value       = module.kubernetes_engine_regional.container_cluster_endpoint
}

output "kms_key_ring_cluster_database_encryption_name" {
  description = "The name of the Google Cloud KMS key ring"
  value       = module.kubernetes_engine_regional.kms_key_ring_cluster_database_encryption_name
}

output "kms_crypto_key_cluster_database_encryption_name" {
  description = "The name of the Google Cloud KMS crypto key for cluster database encryption"
  value       = module.kubernetes_engine_regional.kms_crypto_key_cluster_database_encryption_name
}

output "service_account_gke_operations_email" {
  description = "The email address of the Kubernetes minimum privilege service account for the cluster"
  value       = module.kubernetes_engine_regional.service_account_gke_operations_email
}

output "project_id" {
  description = "The project ID"
  value       = local.main.project_id
}
