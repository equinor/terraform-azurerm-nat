provider "azurerm" {
  features {}
}

resource "random_id" "example" {
  byte_length = 8
}

resource "azurerm_resource_group" "example" {
  name     = "rg-${random_id.example.hex}"
  location = var.location
}

module "nat" {
  # source = "github.com/equinor/terraform-azurerm-nat?ref=v0.0.0"
  source = "../.."

  gateway_name        = "ng-${random_id.example.hex}"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
}
