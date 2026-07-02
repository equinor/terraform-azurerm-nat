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

variable "public_ip_addresses" {
  description = "A map of Public IP addresses to create and associate with this NAT gateway."
  type = map(object({
    name = string
  }))
  nullable = false
  default = {
    # Default to same Public IP address configuration as in Azure Portal.
    "default" = {
      name = "nat-pip"
    }
  }
}

variable "public_ip_prefixes" {
  description = "A map of Public IP prefixes to create and associate with this NAT gateway."
  type = map(object({
    name          = string
    prefix_length = optional(number, 28)
  }))
  nullable = false
  default  = {}
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
