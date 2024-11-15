# Local Values
# https://www.terraform.io/docs/language/values/locals.html

locals {
  main   = data.terraform_remote_state.main.outputs
  subnet = "plt-${module.helpers.region}-${module.helpers.zone}"
}
