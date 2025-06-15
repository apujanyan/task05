variable "name" {
  description = "Name of the app service plan"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region where the app service plan will be created"
  type        = string
}

variable "os_type" {
  description = "Operating system type (Windows or Linux)"
  type        = string
  default     = "Windows"
}

variable "sku_name" {
  description = "SKU name for the app service plan"
  type        = string
}

variable "worker_count" {
  description = "Number of worker instances"
  type        = number
  default     = 1
}

variable "tags" {
  description = "Tags to be applied to the app service plan"
  type        = map(string)
  default     = {}
}