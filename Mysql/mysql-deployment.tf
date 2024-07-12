resource "kubernetes_deployment" "mysql" {
  metadata {
    name = "mysql"
    labels = {
      app = "mysql"
    }
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "mysql"
      }
    }
    template {
      metadata {
        labels = {
          app = "mysql"
        }
      }
      spec {
        container {
          name  = "mysql"
          image = "mysql:latest"
          port {
            container_port = 3306
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
          volume_mount {
            name       = "mysql-data"
            mount_path = "/var/lib/mysql"
          }
          volume_mount {
            name       = "mysql"
            mount_path = "/docker-entrypoint-initdb.d/create_table.sql"
          }
        }
        volume {
          name = "mysql-data"
          persistent_volume_claim {
            claim_name = "mysql-pvc"
          }
        }
        volume {
          name = "mysql"
          config_map {
            name = "mysql"
          }
        }
      }
    }
  }
}
