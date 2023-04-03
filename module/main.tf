variable "deployment_name" {
  type = string
}

variable "image" {
  type = string
}

variable "replicas" {
  type = number
}

resource "kubernetes_deployment" "example" {
  metadata {
    name = var.deployment_name
  }

  spec {
    selector {
      match_labels = {
        App = var.deployment_name
      }
    }

    replicas = var.replicas

    template {
      metadata {
        labels = {
          App = var.deployment_name
        }
      }

      spec {
        container {
          image = var.image
          name  = var.deployment_name
        }
      }
    }
  }
}