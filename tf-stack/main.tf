module "webapp" {
  source = "./modules/webapp"

  internal_port     = var.internal_port
  app_image_name    = var.app_image_name
  app_image_version = var.app_image_version
}