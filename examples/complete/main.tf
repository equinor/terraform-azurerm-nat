provider "azurerm" {
  features {}
}

locals {
  tags = {
    "Environment" = "Development"
  }
}

resource "random_id" "example" {
  byte_length = 8
}

module "network" {
  source = "github.com/equinor/terraform-azurerm-network?ref=v2.0.0"

  vnet_name           = "vnet-${random_id.example.hex}"
  resource_group_name = var.resource_group_name
  location            = var.location
  address_spaces      = ["10.0.0.0/16"]

  subnets = {
    "example" = {
      name             = "snet-${random_id.example.hex}"
      address_prefixes = ["10.0.1.0/24"]
    }
  }
}

resource "azurerm_public_ip" "example" {
  name                = "pip-${random_id.example.hex}"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Standard"
  allocation_method   = "Static"

  tags = local.tags
}

module "nat" {
  # source = "github.com/equinor/terraform-azurerm-nat?ref=v0.0.0"
  source = "../.."

  gateway_name        = "ng-${random_id.example.hex}"
  resource_group_name = var.resource_group_name
  location            = var.location

  subnet_ids            = [module.network.subnet_ids["example"]]
  public_ip_address_ids = [azurerm_public_ip.example.id]

  tags = local.tags
}
