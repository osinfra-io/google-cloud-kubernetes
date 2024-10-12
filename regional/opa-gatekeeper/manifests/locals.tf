# Local Values
# https://www.terraform.io/docs/language/values/locals.html

locals {
  regional = data.terraform_remote_state.regional.outputs
}
