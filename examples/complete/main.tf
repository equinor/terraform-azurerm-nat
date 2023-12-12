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

module "public_ip" {
  source = "github.com/equinor/terraform-azurerm-public-ip?ref=v0.1.0"

  address_name        = "pip-${random_id.example.hex}"
  resource_group_name = var.resource_group_name
  location            = var.location

  tags = local.tags
}

module "nat" {
  # source = "github.com/equinor/terraform-azurerm-nat?ref=v0.0.0"
  source = "../.."

  gateway_name          = "ng-${random_id.example.hex}"
  resource_group_name   = var.resource_group_name
  location              = var.location
  public_ip_address_ids = [module.public_ip.address_id]

  tags = local.tags
}
