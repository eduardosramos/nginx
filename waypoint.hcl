project = "webapp"

app "webapp" {
  labels = {
    "service" = "webapp"
    "env" = "dev"
  }

  build {
    use "docker"{}
    registry {
      use "docker" {
        image = var.image
        tag = var.tag
        local = true
        encoded_auth = filebase64("/home/eduardo/opt/waypoint/nomad/petclinic/dockerAuth.json")
      }
    }
  }

  deploy {
    use "nomad" {
      datacenter = "dc1"
      service_port = 80
    }
  }
}

variable "tag" {
  default     = "latest"
  type        = string
}

variable "image" {
  default     = "nginx"
  type        = string
}
