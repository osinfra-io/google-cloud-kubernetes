# Local Values
# https://www.terraform.io/docs/language/values/locals.html

locals {
  domain_environment = var.environment == "prod" ? "" : var.environment

  env_map = {
    "sandbox"        = "sb"
    "non-production" = "non-prod"
    "production"     = "prod"
  }

  env = lookup(local.env_map, var.environment, "none")

  labels = {
    cost-center = "x001"
    env         = var.environment
    repository  = "google-cloud-kubernetes"
    platform    = "google-cloud-kubernetes"
    team        = "platform-google-cloud-kubernetes"
  }
}
