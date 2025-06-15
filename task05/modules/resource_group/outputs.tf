output "resource_groups" {
  value = { for k, rg in azurerm_resource_group.this : k => {
    name     = rg.name
    location = rg.location
  } }
}