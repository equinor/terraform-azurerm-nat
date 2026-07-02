# Terraform module for Azure NAT Gateway

Terraform module which creates Azure NAT Gateway resources.

## Features

- Creates a StandardV2 tier NAT gateway in the specified resource group.
- Creates and associates a Public IP address with the NAT gateway by default.
- Flow logs sent to given Log Analytics workspace by default (StandardV2 tier only).

## Prerequisites

- Azure role `Contributor` at the resource group scope.
- Azure role `Log Analytics Contributor` at the Log Analytics workspace scope.

## Usage

```terraform
provider "azurerm" {
  features {}
}

module "nat" {
  source  = "equinor/nat/azurerm"
  version = "~> 3.0"

  gateway_name               = "example-gateway"
  resource_group_name        = azurerm_resource_group.example.name
  location                   = azurerm_resource_group.example.location
  log_analytics_workspace_id = module.log_analytics.workspace_id
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "westeurope"
}

module "log_analytics" {
  source  = "equinor/log-analytics/azurerm"
  version = "~> 2.3"

  workspace_name      = "example-workspace"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
}
```

## Contributing

See [Contributing guidelines](https://github.com/equinor/terraform-baseline/blob/main/CONTRIBUTING.md).
