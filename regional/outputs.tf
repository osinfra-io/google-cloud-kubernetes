# Output Values
# https://www.terraform.io/language/values/outputs

output "kubernetes_engine_service_account_default_node_email" {
  description = "The email address of the Kubernetes minimum privilege service account for the cluster"
  value       = module.kubernetes_engine_regional.service_account_default_node_email
}
