variable "resource_groups" {
  type = map(object({
    name     = string
    location = string
  }))
}

variable "app_service_plans" {
  type = map(object({
    name               = string
    resource_group_key = string
    sku                = string
    worker_count       = number
  }))
}

variable "app_services" {
  type = map(object({
    name                 = string
    resource_group_key   = string
    app_service_plan_key = string
  }))
}

variable "traffic_manager" {
  type = object({
    profile_name       = string
    resource_group_key = string
    routing_method     = string
  })
}

variable "common_tags" {
  type    = map(string)
  default = {}
}

variable "verification_ip" {
  type    = string
  default = "18.153.146.156"
}