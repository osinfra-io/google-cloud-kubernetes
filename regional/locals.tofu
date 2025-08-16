# Local Values
# https://opentofu.org/docs/language/values/locals

locals {
  main   = data.terraform_remote_state.main.outputs
  subnet = "plt-${module.helpers.region}-${module.helpers.zone}"
}
