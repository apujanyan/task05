variable "profile_name" {
  type        = string
  description = "The name of the Traffic Manager profile"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the Traffic Manager profile"
}

variable "routing_method" {
  type        = string
  description = "The traffic routing method (e.g., Performance, Weighted, Priority, Geographic)"
}

variable "endpoints" {
  type = list(object({
    name               = string
    target_resource_id = string
  }))
  description = "List of endpoints to add to the Traffic Manager profile"
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource"
  default     = {}
}