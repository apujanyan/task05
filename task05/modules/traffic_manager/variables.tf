variable "profile_name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "routing_method" {
  type = string
}

variable "endpoints" {
  type = list(object({
    name               = string
    target_resource_id = string
  }))
}

variable "tags" {
  type    = map(string)
  default = {}
}