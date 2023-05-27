project = "nginx-debian"

runner {
  enabled = true

  data_source "git" {
    url  = "https://github.com/eduardosramos/nginx.git"
    path = ""
  }
}

app "web" {
  build {
    use "docker"{}
    registry {
      use "docker" {
        image = var.image
        tag = var.tag
        local = true
        encoded_auth = filebase64("/home/eduardo/opt/waypoint/meetup-20-06-2023/nomad/nginx/dockerAuth.json")
      }
    }
  }

  deploy {
    use "docker" {
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
