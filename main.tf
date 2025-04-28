# Datadog Google Cloud Platform Integration Module (osinfra.io)
# https://github.com/osinfra-io/terraform-datadog-google-integration

module "datadog" {
  source = "github.com/osinfra-io/terraform-datadog-google-integration?ref=v0.3.5"
  count  = var.datadog_enable ? 1 : 0

  api_key = var.datadog_api_key
  labels  = module.helpers.labels
  project = module.project.id
}

# Kubernetes cert-manager Module (osinfra.io)
# https://github.com/osinfra-io/terraform-kubernetes-cert-manager

module "kubernetes_cert_manager" {
  source = "github.com/osinfra-io/terraform-kubernetes-cert-manager?ref=v0.1.6"
}

# Google Kubernetes Engine Module (osinfra.io)
# https://github.com/osinfra-io/terraform-google-kubernetes-engine

module "kubernetes_engine" {
  source = "github.com/osinfra-io/terraform-google-kubernetes-engine?ref=v0.2.4"

  labels                     = module.helpers.labels
  namespaces                 = var.kubernetes_engine_namespaces
  project                    = module.project.id
  shared_vpc_host_project_id = var.kubernetes_engine_shared_vpc_host_project_id
}

# Kubernetes Istio Module (osinfra.io)
# https://github.com/osinfra-io/terraform-kubernetes-istio

module "kubernetes_istio" {
  source = "github.com/osinfra-io/terraform-kubernetes-istio?ref=v0.1.8"

  gateway_dns = var.kubernetes_istio_gateway_dns
  labels      = module.helpers.labels
  project     = module.project.id
}

# Google Project Module (osinfra.io)
# https://github.com/osinfra-io/terraform-google-project

module "project" {
  source = "github.com/osinfra-io/terraform-google-project?ref=v0.4.5"

  billing_account                 = var.project_billing_account
  cis_2_2_logging_sink_project_id = var.project_cis_2_2_logging_sink_project_id
  description                     = "k8s"
  folder_id                       = var.project_folder_id
  labels                          = module.helpers.labels
  monthly_budget_amount           = var.project_monthly_budget_amount
  prefix                          = "plt"

  services = [
    "billingbudgets.googleapis.com",
    "certificatemanager.googleapis.com",
    "cloudasset.googleapis.com",
    "cloudbilling.googleapis.com",
    "cloudkms.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "compute.googleapis.com",
    "container.googleapis.com",
    "dns.googleapis.com",
    "gkehub.googleapis.com",
    "iam.googleapis.com",
    "iap.googleapis.com",
    "monitoring.googleapis.com",
    "multiclusteringress.googleapis.com",
    "multiclusterservicediscovery.googleapis.com",
    "securitycenter.googleapis.com",
    "servicenetworking.googleapis.com",
    "serviceusage.googleapis.com",
    "sqladmin.googleapis.com",
    "trafficdirector.googleapis.com"
  ]
}
