provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_namespace" "default" {
  metadata {
    name = "default"
  }
}
