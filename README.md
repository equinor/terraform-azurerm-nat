# Terraform module for Azure NAT Gateway

[![GitHub License](https://img.shields.io/github/license/equinor/terraform-azurerm-nat)](https://github.com/equinor/terraform-azurerm-nat/blob/main/LICENSE)
[![GitHub Release](https://img.shields.io/github/v/release/equinor/terraform-azurerm-nat)](https://github.com/equinor/terraform-azurerm-nat/releases/latest)
[![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-%23FE5196?logo=conventionalcommits&logoColor=white)](https://conventionalcommits.org)
[![SCM Compliance](https://scm-compliance-api.radix.equinor.com/repos/equinor/terraform-azurerm-nat/badge)](https://developer.equinor.com/governance/scm-policy/)

Terraform module which creates Azure NAT Gateway resources.

## Features

- Creates a standard tier NAT gateway in the specified resource group.
- Creates specified Public IP address associations.
- Creates specified Public IP prefix associations.

## Prerequisites

- Azure role `Contributor` at the resource group scope.

## Usage

```terraform
provider "azurerm" {
  features {}
}

module "nat" {
  source  = "equinor/nat/azurerm"
  version = "~> 2.1"

  gateway_name        = "example-gateway"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location

  public_ip_address_ids = [module.public_ip.address_id]
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

module "public_ip" {
  source  = "equinor/public-ip/azurerm"
  version = "~> 1.1"

  address_name               = "example-ip"
  resource_group_name        = azurerm_resource_group.example.name
  location                   = azurerm_resource_group.example.location
  log_analytics_workspace_id = module.log_analytics.workspace_id
}
```

## Contributing

See [Contributing guidelines](https://github.com/equinor/terraform-baseline/blob/main/CONTRIBUTING.md).
