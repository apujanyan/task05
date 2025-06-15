variable "resource_groups" {
  type = map(object({
    name     = string
    location = string
  }))
  description = "Map of resource groups with names and locations"
}

variable "app_service_plans" {
  type = map(object({
    name               = string
    worker_count       = number
    sku                = string
    resource_group_key = string
  }))
  description = "Map of App Service Plans with name, instance count, SKU, and resource group reference"
}

variable "app_services" {
  type = map(object({
    name                 = string
    app_service_plan_key = string
    resource_group_key   = string
  }))
  description = "Map of App Services with name and related App Service Plan and Resource Group"
}

variable "traffic_manager_profile" {
  type = object({
    name               = string
    routing_method     = string
    resource_group_key = string
  })
  description = "Traffic Manager Profile configuration"
}

variable "tags" {
  type        = map(string)
  description = "Common tags applied to all resources"
}

variable "allow-ip" {
  description = "IP address allowed access to Web Apps"
  type        = string
  default     = "18.153.146.156" # your verification agent IP
}

variable "allow-tm" {
  description = "Service tag allowed access to Web Apps"
  type        = string
  default     = "AzureTrafficManager"
}