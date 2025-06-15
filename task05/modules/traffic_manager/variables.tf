variable "traffic_manager_profile" {
  type = object({
    name               = string
    routing_method     = string
    resource_group_key = string
  })
}

variable "resource_groups" {
  type = map(object({
    name     = string
    location = string
  }))
}

variable "app_services" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    default_hostname    = string
  }))
}

variable "tags" {
  type = map(string)
}