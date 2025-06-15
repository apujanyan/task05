variable "resource_groups" {
  type = map(object({
    name     = string
    location = string
  }))
  description = "Map of resource group configurations with name and location"
}

variable "app_service_plans" {
  type = map(object({
    name               = string
    resource_group_key = string
    sku                = string
    worker_count       = number
  }))
  description = "Map of App Service Plan configurations"
}

variable "app_services" {
  type = map(object({
    name                 = string
    resource_group_key   = string
    app_service_plan_key = string
  }))
  description = "Map of App Service configurations"
}

variable "traffic_manager" {
  type = object({
    profile_name       = string
    resource_group_key = string
    routing_method     = string
  })
  description = "Traffic Manager profile configuration"
}

variable "common_tags" {
  type        = map(string)
  description = "Common tags to be applied to all resources"
  default     = {}
}

variable "verification_ip" {
  type        = string
  description = "IP address to allow access to App Services (verification agent)"
}