resource "kubernetes_service" "webapp" {
  metadata {
    name = "webapp"
  }
  spec {
    selector = {
      app = "webapp"
    }
    port {
      protocol    = "TCP"
      port        = 80
      target_port = 80
    }
    type = "LoadBalancer"
  }
}
