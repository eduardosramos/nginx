project = "hashitalk"

app "hashitalk" {

  build {
    use "docker" {}
      registry {
        use "docker"{
          image = "nginx"
          tag   = "latest"
        }
      }
    }
    
    deploy {
      use "nomad" {
        memory = "512"
    }
  }
}
