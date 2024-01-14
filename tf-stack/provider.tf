/*
    Declare & configure our Terraform providers
*/

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

/* provider "docker" {
  // Correct for OSX/Linux; for windows try //var/run/docker.sock
  host = "unix:///var/run/docker.sock"
}*/
