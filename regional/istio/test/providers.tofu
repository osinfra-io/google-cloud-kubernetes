# Required Providers
# https://opentofu.org/docs/language/providers/requirements/

terraform {
  required_providers {

    datadog = {
      source = "datadog/datadog"
    }

    # Google Cloud Platform Provider
    # https://search.opentofu.org/provider/hashicorp/google/latest/docs

    google = {
      source = "hashicorp/google"
    }

    helm = {
      source = "hashicorp/helm"
    }

    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
}

# Datadog Provider
# https://search.opentofu.org/provider/opentofu/datadog/latest

provider "datadog" {
  api_key = var.datadog_api_key
  app_key = var.datadog_app_key
}

# Kubernetes Provider
# https://search.opentofu.org/provider/hashicorp/kubernetes/latest

provider "kubernetes" {
  cluster_ca_certificate = base64decode(
    data.google_container_cluster.this.master_auth.0.cluster_ca_certificate
  )
  host  = "https://${data.google_container_cluster.this.endpoint}"
  token = data.google_client_config.this.access_token
}

# Google Client Config Data Source
# https://search.opentofu.org/provider/hashicorp/google/latest/docs/data-sources/client_config

data "google_client_config" "this" {
}

# Google Container Cluster Data Source
# https://search.opentofu.org/provider/hashicorp/google/latest/docs/data-sources/container_cluster

data "google_container_cluster" "this" {
  name     = "plt-${module.helpers.region}-${module.helpers.zone}"
  location = module.helpers.region
  project  = data.google_project.this.project_id
}

# Google Projects Data Source
# https://search.opentofu.org/provider/hashicorp/google/latest/docs/data-sources/projects

data "google_projects" "this" {
  filter = "name:plt-k8s-* labels.env:${module.helpers.environment}"
}

# Google Project Data Source
# https://search.opentofu.org/provider/hashicorp/google/latest/docs/data-sources/project

data "google_project" "this" {
  project_id = data.google_projects.this.projects.0.project_id
}
