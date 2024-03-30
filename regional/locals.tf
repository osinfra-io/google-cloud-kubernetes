# Local Values
# https://www.terraform.io/docs/language/values/locals.html

locals {
  global = data.terraform_remote_state.global.outputs

  labels = {
    cost-center = "x001"
    env         = var.environment
    repository  = "google-cloud-kubernetes"
    platform    = "google-cloud-kubernetes"
    team        = "platform-google-cloud-kubernetes"
  }

}
