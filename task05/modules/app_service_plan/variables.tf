variable "app_service_plans" {
  type = map(object({
    name               = string
    worker_count       = number
    sku                = string
    resource_group_key = string
  }))
}

variable "resource_groups" {
  type = map(object({
    name     = string
    location = string
  }))
}

variable "tags" {
  type = map(string)
}