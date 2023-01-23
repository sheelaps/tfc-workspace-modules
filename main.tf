variable "name" {}
variable "location" {}
variable "username" {}
variable "password" {}

provider "azurerm" {
  features {}
}

variable "vnet_address_spacing" {
  type = list
}

variable "subnet_address_prefixes" {
  type = list
}

module "networking" {
  source  = "app.terraform.io/testterraformorg1/networking/azurerm"
  version = "1.1.9"

  name                    = var.name
  location                = var.location
  vnet_address_spacing    = var.vnet_address_spacing
  subnet_address_prefixes = [ "10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24" ]
}
