resource "kubernetes_persistent_volume" "mysql_pv" {
  metadata {
    name = "mysql-pv"
  }
  spec {
    capacity = {
      storage = "10Gi"
    }
    access_modes = ["ReadWriteOnce"]
    host_path {
      path = "/mnt/data/mysql"
    }
  }
}

resource "kubernetes_persistent_volume_claim" "mysql_pvc" {
  metadata {
    name = "mysql-pvc"
  }
  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "10Gi"
      }
    }
    volume_name = "mysql-pv"
  }
}
