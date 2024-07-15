

resource "kubernetes_config_map" "mysql" {
  metadata {
    name = "my-config"
  }

  data = {
    "my_config_file.yml" = "my_configmap.yml"
  }
}