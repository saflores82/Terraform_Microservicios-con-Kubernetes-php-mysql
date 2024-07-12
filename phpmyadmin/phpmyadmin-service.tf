resource "kubernetes_service" "phpmyadmin" {
  metadata {
    name = "phpmyadmin"
  }
  spec {
    selector = {
      app = "phpmyadmin"
    }
    port {
      protocol    = "TCP"
      port        = 8080
      target_port = 80
    }
    type = "LoadBalancer"
  }
}
