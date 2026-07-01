variable "gateway_name" {
  description = "The name of this NAT gateway."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group to create the resources in."
  type        = string
}

variable "location" {
  description = "The location to create the resources in."
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics workspace to send diagnostics to."
  type        = string
  nullable    = false
}

variable "public_ip_address_ids" {
  description = "A list of IDs of Public IP addresses to associate with this NAT gateway."
  type        = list(string)
  default     = []
}

variable "public_ip_prefix_ids" {
  description = "A list of IDs of Public IP prefixes to associate with this NAT gateway."
  type        = list(string)
  default     = []
}

variable "diagnostic_setting_name" {
  description = "The name of this diagnostic setting."
  type        = string
  nullable    = false
  default     = "flow-logs"
}

variable "diagnostic_setting_enabled_log_categories" {
  description = "A list of log categories to be enabled for this diagnostic setting."
  type        = list(string)
  nullable    = false
  default     = ["NatGatewayFlowLogsV1"]
}

variable "diagnostic_setting_enabled_metric_categories" {
  description = "A list of metric categories to be enabled for this diagnostic setting."
  type        = list(string)
  nullable    = false
  default     = []
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}
