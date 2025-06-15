variable "resource_groups" {
  type = map(object({
    name     = string
    location = string
  }))
}

variable "tags" {
  type = map(string)
}