# Terraform Remote State Datasource
# https://www.terraform.io/docs/language/state/remote-state-data.html

data "terraform_remote_state" "main" {
  backend = "gcs"

  config = {
    bucket = var.remote_bucket
    prefix = module.helpers.repository
  }

  workspace = "main-${module.helpers.environment}"
}

# Kubernetes Istio Module (osinfra.io)
# https://github.com/osinfra-io/terraform-kubernetes-istio

module "kubernetes_istio" {
  source = "github.com/osinfra-io/terraform-kubernetes-istio//regional?ref=v0.2.0"

  artifact_registry          = "us-docker.pkg.dev/plt-lz-services-tf79-prod/plt-docker-virtual"
  cluster_prefix             = "plt"
  enable_istio_gateway       = true
  gateway_cpu_limits         = var.kubernetes_istio_gateway_cpu_limits
  gateway_cpu_requests       = var.kubernetes_istio_gateway_cpu_requests
  gateway_dns                = var.kubernetes_istio_gateway_dns
  gateway_mci_global_address = data.terraform_remote_state.main.outputs.kubernetes_istio_gateway_mci_global_address
  gateway_memory_limits      = var.kubernetes_istio_gateway_memory_limits
  gateway_memory_requests    = var.kubernetes_istio_gateway_memory_requests
  labels                     = module.helpers.labels

  multi_cluster_service_clusters = [
    {
      "link" = "us-east1/plt-us-east1-b"
    },
    {
      "link" = "us-east4/plt-us-east4-a"
    }
  ]

  pilot_cpu_limits                            = var.kubernetes_istio_pilot_cpu_limits
  pilot_cpu_requests                          = var.kubernetes_istio_pilot_cpu_requests
  pilot_memory_limits                         = var.kubernetes_istio_pilot_memory_limits
  pilot_memory_requests                       = var.kubernetes_istio_pilot_memory_requests
  project                                     = data.google_project.this.project_id
  proxy_cpu_limits                            = var.kubernetes_istio_proxy_cpu_limits
  proxy_cpu_requests                          = var.kubernetes_istio_proxy_cpu_requests
  proxy_memory_limits                         = var.kubernetes_istio_proxy_memory_limits
  proxy_memory_requests                       = var.kubernetes_istio_proxy_memory_requests
  tls_self_signed_cert_cert_manager_root_cert = local.main.kubernetes_cert_manager_tls_self_signed_cert_cert_manager_root_cert
  tls_self_signed_cert_cert_manager_root_key  = local.main.kubernetes_cert_manager_tls_self_signed_cert_cert_manager_root_key
}

# Kubernetes Deployment Resource
# https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/deployment_v1

resource "kubernetes_deployment_v1" "datadog_aap_extproc" {
  metadata {
    name      = "datadog-aap-extproc-deployment"
    namespace = "istio-ingress"
    labels = {
      app                          = "datadog-aap-extproc"
      "tags.datadoghq.com/env"     = module.helpers.environment
      "tags.datadoghq.com/service" = "istio-gateway"
    }
  }

  spec {
    selector {
      match_labels = {
        app = "datadog-aap-extproc"
      }
    }

    template {
      metadata {
        annotations = {
          "apm.datadoghq.com/env" = jsonencode({
            "DD_ENV"     = module.helpers.environment
            "DD_SERVICE" = "istio-gateway"
          })
          "sidecar.istio.io/inject" = "false"
        }

        labels = {
          app                               = "datadog-aap-extproc"
          "admission.datadoghq.com/enabled" = "true"
          "tags.datadoghq.com/env"          = module.helpers.environment
          "tags.datadoghq.com/service"      = "istio-gateway"
        }
      }

      spec {
        container {
          env {
            name = "DD_ENV"
            value_from {
              field_ref {
                field_path = "metadata.labels['tags.datadoghq.com/env']"
              }
            }
          }

          env {
            name = "DD_SERVICE"
            value_from {
              field_ref {
                field_path = "metadata.labels['tags.datadoghq.com/service']"
              }
            }
          }

          env {
            name  = "DD_APPSEC_WAF_TIMEOUT"
            value = "10000"
          }

          name              = "datadog-aap-extproc-container"
          image             = "ghcr.io/datadog/dd-trace-go/service-extensions-callout:v1.73.1"
          image_pull_policy = "Always"

          port {
            name           = "grpc"
            container_port = 443
          }

          port {
            name           = "health"
            container_port = 80
          }

          readiness_probe {
            http_get {
              path = "/"
              port = "health"
            }

            initial_delay_seconds = 5
            period_seconds        = 10
          }

          liveness_probe {
            http_get {
              path = "/"
              port = "health"
            }

            initial_delay_seconds = 15
            period_seconds        = 20
          }

          resources {
            limits = {
              cpu    = "100m"
              memory = "256Mi"
            }

            requests = {
              cpu    = "50m"
              memory = "128Mi"
            }
          }
        }
      }
    }
  }

  depends_on = [
    module.kubernetes_istio
  ]
}

# Kubernetes Service Resource
# https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service_v1

resource "kubernetes_service_v1" "datadog_aap_extproc" {
  metadata {
    name      = "datadog-aap-extproc-service"
    namespace = "istio-ingress"
    labels = {
      app = "datadog-aap-extproc"
    }
  }

  spec {
    selector = {
      app = "datadog-aap-extproc"
    }

    port {
      name        = "grpc"
      port        = 443
      target_port = "grpc"
      protocol    = "TCP"
    }

    type = "ClusterIP"
  }
}
