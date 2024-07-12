resource "kubernetes_config_map" "mysql" {
  metadata {
    name = "mysql"
  }
  data = {
    create_table.sql = <<-EOT
      CREATE TABLE example_table (
          id INT PRIMARY KEY AUTO_INCREMENT,
          name VARCHAR(255) NOT NULL,
          created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
      );
    EOT
  }
}
