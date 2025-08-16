terraform {

  # Requiring Providers
  # https://opentofu.org/docs/language/providers/requirements/

  required_providers {

    # Datadog Provider
    # https://search.opentofu.org/provider/opentofu/datadog/latest

    datadog = {
      source = "datadog/datadog"
    }

    # Google Cloud Platform Provider
    # https://search.opentofu.org/provider/hashicorp/google/latest/docs

    google = {
      source = "hashicorp/google"
    }
  }
}

provider "datadog" {
  api_key = var.datadog_api_key
  app_key = var.datadog_app_key
}
