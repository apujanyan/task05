variable "resource_groups" {
  description = "Map of resource groups configuration"
  type = map(object({
    name     = string
    location = string
  }))
}

variable "app_service_plans" {
  description = "Map of app service plans configuration"
  type = map(object({
    name               = string
    resource_group_key = string
    os_type            = string
    sku_name           = string
    worker_count       = number
  }))
}

variable "app_services" {
  description = "Map of app services configuration"
  type = map(object({
    name                  = string
    resource_group_key    = string
    app_service_plan_key  = string
    verification_agent_ip = string
  }))
}

variable "traffic_manager" {
  description = "Traffic Manager configuration"
  type = object({
    name               = string
    resource_group_key = string
    routing_method     = string
    dns_config = object({
      relative_name = string
      ttl           = number
    })
    monitor_config = object({
      protocol = string
      port     = number
      path     = string
    })
  })
}

variable "tags" {
  description = "Common tags to be applied to all resources"
  type        = map(string)
  default     = {}
}