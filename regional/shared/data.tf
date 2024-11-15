# Google Client Config Data Source
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config

data "google_client_config" "this" {
}

# Google Container Cluster Data Source
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/container_cluster

data "google_container_cluster" "this" {
  name     = "plt-${module.helpers.region}-${module.helpers.zone}"
  location = module.helpers.region
  project  = data.google_project.this.project_id
}

# Google Projects Data Source
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/projects

data "google_projects" "this" {
  filter = "name:plt-k8s-* labels.env:${module.helpers.environment}"
}

# Google Project Data Source
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project

data "google_project" "this" {
  project_id = data.google_projects.this.projects.0.project_id
}
