/*
    Build our Docker image
*/

resource "docker_image" "image" {
  name = "${var.app_image_name}:${var.app_image_version}"

  build {
    context = "${path.cwd}/../app"
  }

  triggers = {
    dir_sha1 = sha1(join("", [for f in fileset(path.module, "../app/*") : filesha1(f)]))
  }
}



/*
    Deploy it to our "server" (really a local Docker instance)
*/

resource "docker_container" "webapp" {
  name  = "webapp"
  image = docker_image.image.image_id

  ports {
    internal = "${var.internal_port}"
    protocol = "tcp"
  }
}
