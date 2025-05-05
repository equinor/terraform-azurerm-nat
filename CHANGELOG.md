# Changelog

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
