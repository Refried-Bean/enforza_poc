variable "prefix" {
  default = "enforza-poc"
}

variable "location" {
  default = "East US"
}

variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}
variable "enforza_company_id" {}

variable "admin_username" {
  default = "azureuser"
}

variable "admin_password" {}

variable "vnet_address_space" {
  default = "10.0.0.0/16"
}

variable "subnet_prefixes" {
  type = map(string)
  default = {
    protected = "10.0.1.0/24"
    firewall  = "10.0.2.0/24"
    bastion   = "10.0.3.0/24"
  }
}
