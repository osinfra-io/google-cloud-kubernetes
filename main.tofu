# Datadog Google Cloud Platform Integration Module (osinfra.io)
# https://github.com/osinfra-io/opentofu-datadog-google-integration

module "datadog" {
  source = "github.com/osinfra-io/opentofu-datadog-google-integration?ref=3e87e321842678ad478ba2c8d007a7685338e8d7" # v0.3.5
  count  = var.datadog_enable ? 1 : 0

  api_key = var.datadog_api_key
  labels  = module.helpers.labels
  project = module.project.id
}

# Kubernetes cert-manager Module (osinfra.io)
# https://github.com/osinfra-io/opentofu-kubernetes-cert-manager

module "kubernetes_cert_manager" {
  source = "github.com/osinfra-io/opentofu-kubernetes-cert-manager?ref=6d8932f1f50f2688a2132feab870c9fef3b4e709" # v0.1.7
}

# Google Kubernetes Engine Module (osinfra.io)
# https://github.com/osinfra-io/opentofu-google-kubernetes-engine

module "kubernetes_engine" {
  # source = "github.com/osinfra-io/opentofu-google-kubernetes-engine?ref=e67d2b9113d150efd7a68bb599795343f9e3620c" # v0.2.5
  source = "github.com/osinfra-io/opentofu-google-kubernetes-engine?ref=configsync"

  labels                     = module.helpers.labels
  namespaces                 = var.kubernetes_engine_namespaces
  project                    = module.project.id
  shared_vpc_host_project_id = var.kubernetes_engine_shared_vpc_host_project_id
}

# Kubernetes Istio Module (osinfra.io)
# https://github.com/osinfra-io/opentofu-kubernetes-istio

module "kubernetes_istio" {
  source = "github.com/osinfra-io/opentofu-kubernetes-istio?ref=a325290911bdb8085ea29ff922d2e00f00834f4a" # v0.2.0

  gateway_dns = var.kubernetes_istio_gateway_dns
  labels      = module.helpers.labels
  project     = module.project.id
}

# Google Project Module (osinfra.io)
# https://github.com/osinfra-io/opentofu-google-project

module "project" {
  source = "github.com/osinfra-io/opentofu-google-project?ref=655916e58848e16af406e4968b25bb77fb0f1119" # v0.4.5

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
