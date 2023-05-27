project = "nginx"

runner {
  enabled = true

  data_source "git" {
    url  = "https://github.com/eduardosramos/nginx.git"
    path = ""
  }
}

app "web" {
  build {
    use "docker" {
    }
  }

  deploy {
    use "nomad" {
    }
  }
}
