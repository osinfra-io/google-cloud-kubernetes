# Output Values
# https://www.terraform.io/language/values/outputs

output "container_cluster_ca_certificate" {
  description = "Base64 encoded public certificate that is the root of trust for the cluster"
  sensitive   = true
  value       = length(module.kubernetes) > 0 ? module.kubernetes[0].container_cluster_ca_certificate : null
}

output "container_cluster_endpoint" {
  description = "The connection endpoint for the cluster"
  value       = length(module.kubernetes) > 0 ? module.kubernetes[0].container_cluster_endpoint : null
}

output "project_id" {
  description = "The project ID"
  value       = local.global.project_id
}
