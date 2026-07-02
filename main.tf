resource "azurerm_nat_gateway" "this" {
  name                = var.gateway_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku_name            = var.sku_name

  tags = var.tags
}

resource "azurerm_public_ip" "this" {
  for_each = var.public_ip_addresses

  name                = each.value.name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku_name # Must match NAT gateway SKU name.
  allocation_method   = "Static"     # Required when SKU is "StandardV2" or "Standard".
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
  sku                 = var.sku_name # Must match NAT gateway SKU name.
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
  count = var.sku_name == "StandardV2" ? 1 : 0

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

  lifecycle {
    precondition {
      condition     = var.log_analytics_workspace_id != null
      error_message = "Log Analytics workspace ID must be set when SKU name is \"StandardV2\"."
    }
  }
}
