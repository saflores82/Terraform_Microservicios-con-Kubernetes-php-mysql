resource "kubernetes_deployment" "webapp" {
  metadata {
    name = "webapp"
    labels = {
      app = "webapp"
    }
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "webapp"
      }
    }
    template {
      metadata {
        labels = {
          app = "webapp"
        }
      }
      spec {
        container {
          name  = "webapp"
          image = "192.168.49.2:5000/webapp:latest"
          image_pull_policy = "IfNotPresent"
          port {
            container_port = 80
          }
          env {
            name  = "MYSQL_ROOT_PASSWORD"
            value = "example_password"
          }
          env {
            name  = "MYSQL_DATABASE"
            value = "my_database"
          }
          env {
            name  = "MYSQL_USER"
            value = "my_user"
          }
          env {
            name  = "MYSQL_PASSWORD"
            value = "my_password"
          }
          env {
            name  = "MYSQL_HOST"
            value = "mysql"
          }
        }
      }
    }
  }
}
