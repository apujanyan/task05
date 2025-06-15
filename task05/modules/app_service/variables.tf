variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "app_service_plan_id" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "allowed_ips" {
  type    = list(string)
  default = []
}

variable "allowed_service_tags" {
  type    = list(string)
  default = []
}