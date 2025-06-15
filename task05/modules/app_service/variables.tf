variable "name" {
  description = "Name of the app service"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region where the app service will be created"
  type        = string
}

variable "service_plan_id" {
  description = "ID of the app service plan"
  type        = string
}

variable "verification_agent_ip" {
  description = "IP address of the verification agent"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to the app service"
  type        = map(string)
  default     = {}
}