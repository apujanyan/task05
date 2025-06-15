variable "name" {
  description = "Name of the traffic manager profile"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "routing_method" {
  description = "Traffic routing method"
  type        = string
  default     = "Performance"
}

variable "dns_config" {
  description = "DNS configuration for traffic manager"
  type = object({
    relative_name = string
    ttl           = number
  })
}

variable "monitor_config" {
  description = "Monitor configuration for traffic manager"
  type = object({
    protocol = string
    port     = number
    path     = string
  })
}

variable "endpoints" {
  description = "List of endpoints for traffic manager"
  type = list(object({
    name               = string
    target_resource_id = string
    weight             = number
    priority           = number
  }))
}

variable "tags" {
  description = "Tags to be applied to the traffic manager profile"
  type        = map(string)
  default     = {}
}