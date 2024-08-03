# Local Values
# https://www.terraform.io/docs/language/values/locals.html

locals {
  main = data.terraform_remote_state.main.outputs

  labels = {
    cost-center = "x001"
    env         = var.environment
    repository  = "google-cloud-kubernetes"
    platform    = "google-cloud-kubernetes"
    team        = "platform-google-cloud-kubernetes"
  }
}
