variable "app_name" {
  type = string
}

variable "image" {
  type = string
}

variable "replicas" {
  type    = number
  default = 1
}

variable "port" {
  type    = number
  default = 80
}

resource "kubernetes_deployment" "app" {
  metadata {
    name = var.app_name
    labels = {
      app = var.app_name
    }
  }

  spec {
    replicas = var.replicas

    selector {
      match_labels = {
        app = var.app_name
      }
    }

    template {
      metadata {
        labels = {
          app = var.app_name
        }
      }

      spec {
        container {
          name  = var.app_name
          image = var.image

          port {
            container_port = var.port
          }
        }
      }
    }
  }
}