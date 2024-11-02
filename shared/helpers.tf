# Terraform Core Helpers Module (osinfra.io)
# https://github.com/osinfra-io/terraform-core-helpers

module "helpers" {
  source = "github.com/osinfra-io/terraform-core-helpers?ref=main"

  cost_center         = "x001"
  data_classification = "public"
  email               = "platform-google-cloud-kubernetes@osinfra.io"
  repository          = "osinfra-io/google-cloud-kubernetes"
  team                = "platform-google-cloud-kubernetes"
}
