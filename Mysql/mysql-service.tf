resource "kubernetes_service" "mysql" {
  metadata {
    name = "mysql"
  }
  spec {
    selector = {
      app = "mysql"
    }
    port {
      protocol    = "TCP"
      port        = 3306
      target_port = 3306
    }
    type = "LoadBalancer"
  }
}
