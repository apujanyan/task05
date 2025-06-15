variable "app_services" {
  type = map(object({
    name                 = string
    app_service_plan_key = string
    resource_group_key   = string
  }))
  description = "Map of App Services with name, App Service Plan key, and Resource Group key"
}

variable "resource_groups" {
  type = map(object({
    name     = string
    location = string
  }))
  description = "Map of Resource Groups to be used for App Services"
}

variable "app_service_plans" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
  }))
  description = "Map of App Service Plans to attach App Services to"
}

variable "allow-ip" {
  description = "Verification agent IP address allowed to access App Service"
  type        = string
}

variable "allow-tm" {
  description = "Traffic Manager service tag"
  type        = string
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to App Services"
}
