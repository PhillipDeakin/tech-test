/*
    Outputs from the stack
*/

output "webapp_url" {
  value = "http://172.0.0.1:${docker_container.webapp.ports[0].external}"
}
