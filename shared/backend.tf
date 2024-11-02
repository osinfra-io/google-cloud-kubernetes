terraform {
  backend "gcs" {
    prefix = "google-cloud-kubernetes"
  }
}
