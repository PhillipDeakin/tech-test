variable "internal_port" {
  type        = number
  description = "Internal Port to open"
  default     = 80
}
variable "app_image_name" {
  type        = string
  description = "Name for the Docker image we build"
  default     = ""
}

variable "app_image_version" {
  type        = string
  description = "Version number for the Docker image we build"
  default     = ""
}