# Local Values
# https://www.terraform.io/docs/language/values/locals.html

locals {

  labels = {
    cost-center = "x001"
    env         = var.environment
    repository  = "google-cloud-kubernetes"
    platform    = "google-cloud-kubernetes"
    team        = "platform-google-cloud-kubernetes"
  }

  regional = data.terraform_remote_state.regional.outputs
}
