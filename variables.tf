variable "access_key" {
}

variable "secret_key" {
}

variable "region" {
  default = "eu-west-2"
}

variable "regions_map" {
  description = "Map of regions to their address spaces"
  default = {
    "eu-west-2" = ["10.1.0.0/16"]
  }
}
