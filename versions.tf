terraform {
  required_version = ">= 1.0.0"

  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      # Adds support for the "StandardV2" SKU.
      # Ref: https://github.com/hashicorp/terraform-provider-azurerm/blob/main/CHANGELOG.md#4670-april-02-2026
      version = ">= 4.67.0"
    }
  }
}
