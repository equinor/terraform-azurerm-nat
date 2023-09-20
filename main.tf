resource "azurerm_nat_gateway" "this" {
  name                = var.gateway_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku_name            = "Standard" # Only supported value

  tags = var.tags
}

resource "azurerm_subnet_nat_gateway_association" "this" {
  count = length(var.subnet_ids)

  nat_gateway_id = azurerm_nat_gateway.this.id
  subnet_id      = var.subnet_ids[count.index]
}

resource "azurerm_nat_gateway_public_ip_association" "this" {
  count = length(var.public_ip_address_ids)

  nat_gateway_id       = azurerm_nat_gateway.this.id
  public_ip_address_id = var.public_ip_address_ids[count.index]
}
