provider "azurerm" {
  features {}
}

resource "random_id" "example" {
  byte_length = 8
}

module "nat" {
  # source = "github.com/equinor/terraform-azurerm-nat?ref=v0.0.0"
  source = "../.."

  gateway_name        = "ng-${random_id.example.hex}"
  resource_group_name = var.resource_group_name
  location            = var.location
}
