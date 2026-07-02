# Changelog

## [3.0.0](https://github.com/equinor/terraform-azurerm-nat/compare/v2.1.2...v3.0.0) (2026-07-02)


### ⚠ BREAKING CHANGES

* remove variables `public_ip_address_ids` and `public_ip_prefix_ids`. Create Public IP resources using the `public_ip_addresses` and `public_ip_prefixes` variables instead.
* add required variable `log_analytics_workspace_id`.

### Features

* add variable `sku_name` ([#27](https://github.com/equinor/terraform-azurerm-nat/issues/27)) ([7d3a39e](https://github.com/equinor/terraform-azurerm-nat/commit/7d3a39ed925275ea295ca59e8864ca6f2caf6ba4))
* create Public IP addresses and prefixes ([#26](https://github.com/equinor/terraform-azurerm-nat/issues/26)) ([8e888c5](https://github.com/equinor/terraform-azurerm-nat/commit/8e888c51b33af7429044c865ab36bc42b7594d32))
* send flow logs to Log Analytics workspace ([#24](https://github.com/equinor/terraform-azurerm-nat/issues/24)) ([0fa28a5](https://github.com/equinor/terraform-azurerm-nat/commit/0fa28a5777c7461cc03a7a77cdf07d551347e441))

## [2.1.2](https://github.com/equinor/terraform-azurerm-nat/compare/v2.1.1...v2.1.2) (2025-05-05)


### Documentation

* update README header ([5070335](https://github.com/equinor/terraform-azurerm-nat/commit/5070335d4e4c52f53961c043d4b06f2d676e34ca))

## [2.1.1](https://github.com/equinor/terraform-azurerm-nat/compare/v2.1.0...v2.1.1) (2025-05-05)


### Documentation

* update README ([8c5d5b8](https://github.com/equinor/terraform-azurerm-nat/commit/8c5d5b8c2e09d7d8c3b1af8a586afe28d5bc1ccf))

## [2.1.0](https://github.com/equinor/terraform-azurerm-nat/compare/v2.0.1...v2.1.0) (2024-09-06)


### Features

* create Public IP prefix associations ([#20](https://github.com/equinor/terraform-azurerm-nat/issues/20)) ([ad990fe](https://github.com/equinor/terraform-azurerm-nat/commit/ad990fec0f8d97e71fc607f1e6ec66f6341d6f00))

## [2.0.1](https://github.com/equinor/terraform-azurerm-nat/compare/v2.0.0...v2.0.1) (2024-08-26)


### Documentation

* update variable description ([#18](https://github.com/equinor/terraform-azurerm-nat/issues/18)) ([e213afa](https://github.com/equinor/terraform-azurerm-nat/commit/e213afae2f79595a77687b4e9c9a148bc15a212e))

## [2.0.0](https://github.com/equinor/terraform-azurerm-nat/compare/v1.0.0...v2.0.0) (2023-12-18)


### ⚠ BREAKING CHANGES

* remove variable `subnet_ids` and resources `azurerm_subnet_nat_gateway_association`. To migrate your project, remove any references to variable `subnet_ids` and move any resources `azurerm_subnet_nat_gateway_association` to another module in your configuration.

### Features

* don't create subnet association ([#8](https://github.com/equinor/terraform-azurerm-nat/issues/8)) ([d34dca0](https://github.com/equinor/terraform-azurerm-nat/commit/d34dca084a2cec03ff2a484e365e14005c8f74eb))

## 0.1.0 (2023-09-20)


### Features

* create initial module ([#1](https://github.com/equinor/terraform-azurerm-nat/issues/1)) ([d2fc2b1](https://github.com/equinor/terraform-azurerm-nat/commit/d2fc2b17bb5cd35b045ed77abbbb56c15f36a27c))
