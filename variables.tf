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

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}
