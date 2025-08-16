# Required Providers
# https://opentofu.org/docs/language/providers/requirements/

terraform {
  required_providers {

    # Google Cloud Platform Provider
    # https://search.opentofu.org/provider/hashicorp/google/latest/docs

    google = {
      source = "hashicorp/google"
    }
  }
}
