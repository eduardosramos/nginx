project = "hashitalk"

app "hashitalk" {

  build {
    use "pack" {}
      registry {
        use "docker"{
          image = "ttl.sh/izaakcorp-demoapp"
          tag   = "1h"
        }
      }
    }
    
    deploy {
      use "nomad" {
        memory = "512"
    }
  }
}
