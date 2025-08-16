# Required Providers
# https://opentofu.org/docs/language/providers/requirements/

terraform {
  required_providers {

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

# Helm Provider
# https://search.opentofu.org/provider/hashicorp/helm/latest

provider "helm" {
  kubernetes = {

    cluster_ca_certificate = base64decode(
      data.google_container_cluster.this.master_auth.0.cluster_ca_certificate
    )

    host  = data.google_container_cluster.this.endpoint
    token = data.google_client_config.this.access_token
  }
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
