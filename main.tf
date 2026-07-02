resource "azurerm_nat_gateway" "this" {
  name                = var.gateway_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku_name            = "StandardV2" # Required to create a diagnostic setting.

  tags = var.tags
}

resource "azurerm_public_ip" "this" {
  for_each = var.public_ip_addresses

  name                = each.value.name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "StandardV2" # Required when NAT gateway SKU name is "StandardV2".
  allocation_method   = "Static"     # Required when SKU is "StandardV2".
  ip_version          = each.value.ip_version

  tags = var.tags
}

resource "azurerm_nat_gateway_public_ip_association" "this" {
  for_each = azurerm_public_ip.this

  nat_gateway_id       = azurerm_nat_gateway.this.id
  public_ip_address_id = each.value.id
}

resource "azurerm_public_ip_prefix" "this" {
  for_each = var.public_ip_prefixes

  name                = each.value.name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "StandardV2" # Required when NAT gateway SKU name is "StandardV2".
  ip_version          = each.value.ip_version
  prefix_length       = each.value.prefix_length

  tags = var.tags
}

resource "azurerm_nat_gateway_public_ip_prefix_association" "this" {
  for_each = azurerm_public_ip_prefix.this

  nat_gateway_id      = azurerm_nat_gateway.this.id
  public_ip_prefix_id = each.value.id
}

# Don't create "azurerm_subnet_nat_gateway_association" resources in this module.
# They should be created in the Azure Network module instead:
# https://registry.terraform.io/modules/equinor/network/azurerm/latest
#
# This ensures a standard approach to associating a subnet with a NAT gateway:
# a subnet is associated with a NAT gateway during subnet creation.

resource "azurerm_monitor_diagnostic_setting" "this" {
  name                           = var.diagnostic_setting_name
  target_resource_id             = azurerm_nat_gateway.this.id
  log_analytics_workspace_id     = var.log_analytics_workspace_id
  log_analytics_destination_type = "Dedicated"

  dynamic "enabled_log" {
    for_each = toset(var.diagnostic_setting_enabled_log_categories)

    content {
      category = enabled_log.value
    }
  }

  dynamic "enabled_metric" {
    for_each = toset(var.diagnostic_setting_enabled_metric_categories)

    content {
      category = enabled_metric.value
    }
  }
}
