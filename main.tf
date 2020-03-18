resource "kubernetes_deployment" "nexus" {
  metadata {
    name = "terraform-nexus"
    labels = {
      test = "MyExampleNexus"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        test = "MyExampleNexus"
      }
    }

    template {
      metadata {
        labels = {
          test = "MyExampleNexus"
        }
      }

      spec {
        container {
          image = "sonatype/nexus3:3.21.1"
          name  = "nexus"
          #volume {
          #  name = "var_efs_volume_path"
          #}
          /*
          nfs {
            path      =
            read_only =
            server    =
          }
          */
        }
        /*
                  resources {
                    limits {
                      cpu    = "0.5"
                      memory = "512Mi"
                    }
                    requests {
                      cpu    = "250m"
                      memory = "50Mi"
                    }
                  }

                  liveness_probe {
                    http_get {
                      path = "/nginx_status"
                      port = 80

                      http_header {
                        name  = "X-Custom-Header"
                        value = "Awesome"
                      }
                    }

                    initial_delay_seconds = 3
                    period_seconds        = 3
                  }
        */
      }
    }
  }
}
