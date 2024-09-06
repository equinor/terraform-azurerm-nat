resource "azurerm_nat_gateway" "this" {
  name                = var.gateway_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku_name            = "Standard" # Only supported value

  tags = var.tags
}

resource "azurerm_nat_gateway_public_ip_association" "this" {
  count = length(var.public_ip_address_ids)

  nat_gateway_id       = azurerm_nat_gateway.this.id
  public_ip_address_id = var.public_ip_address_ids[count.index]
}

resource "azurerm_nat_gateway_public_ip_prefix_association" "this" {
  count = length(var.public_ip_prefix_ids)

  nat_gateway_id      = azurerm_nat_gateway.this.id
  public_ip_prefix_id = var.public_ip_prefix_ids[count.index]
}

# Don't create "azurerm_subnet_nat_gateway_association" resources in this module.
# They should be created in the Azure Network module instead:
# https://registry.terraform.io/modules/equinor/network/azurerm/latest
#
# This ensures a standard approach to associating a subnet with a NAT gateway:
# a subnet is associated with a NAT gateway during subnet creation.
