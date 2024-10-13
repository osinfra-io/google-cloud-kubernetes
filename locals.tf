# Local Values
# https://www.terraform.io/docs/language/values/locals.html

locals {
  domain_environment = local.environment == "prod" ? "" : local.environment

  env = lookup(local.env_map, local.environment, "none")

  environment = (
    terraform.workspace == "default" ?
    "mock-environment" :
    regex(".*-(?P<environment>[^-]+)$", terraform.workspace)["environment"]
  )

  env_map = {
    "non-production" = "nonprod"
    "production"     = "prod"
    "sandbox"        = "sb"
  }

  labels = {
    cost-center = "x001"
    env         = local.environment
    repository  = "google-cloud-kubernetes"
    platform    = "google-cloud-kubernetes"
    team        = "platform-google-cloud-kubernetes"
  }
}
