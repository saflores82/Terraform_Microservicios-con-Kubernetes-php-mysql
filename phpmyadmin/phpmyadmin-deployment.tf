resource "kubernetes_deployment" "phpmyadmin" {
  metadata {
    name = "phpmyadmin"
    labels = {
      app = "phpmyadmin"
    }
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "phpmyadmin"
      }
    }
    template {
      metadata {
        labels = {
          app = "phpmyadmin"
        }
      }
      spec {
        container {
          name  = "phpmyadmin"
          image = "phpmyadmin/phpmyadmin:latest"
          port {
            container_port = 80
          }
          env {
            name  = "PMA_HOST"
            value = "mysql"
          }
          env {
            name  = "MYSQL_ROOT_PASSWORD"
            value = "example_password"
          }
        }
      }
    }
  }
}
