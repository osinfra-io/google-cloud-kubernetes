# Local Values
# https://www.terraform.io/docs/language/values/locals.html

locals {
  environment = (
    terraform.workspace == "default" ?
    "mock-environment" :
    regex(".*-(?P<environment>[^-]+)$", terraform.workspace)["environment"]
  )


  region = (
    terraform.workspace == "default" ?
    "mock-region" :
    regex("^(?P<region>[^-]+-[^-]+)", terraform.workspace)["region"]
  )

  zone = (
    terraform.workspace == "default" ?
    "mock-zone" :
    (
      regex("^(?P<region>[^-]+-[^-]+)(?:-(?P<zone>[^-]+))?-.*$", terraform.workspace)["zone"] != "" ?
      regex("^(?P<region>[^-]+-[^-]+)(?:-(?P<zone>[^-]+))?-.*$", terraform.workspace)["zone"] :
      null
    )
  )

  main = data.terraform_remote_state.main.outputs

  labels = {
    cost-center = "x001"
    env         = local.environment
    repository  = "google-cloud-kubernetes"
    platform    = "google-cloud-kubernetes"
    team        = "platform-google-cloud-kubernetes"
  }

  regional = data.terraform_remote_state.regional.outputs
}
