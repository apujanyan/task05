output "app_service_plans" {
  value = { for k, asp in azurerm_app_service_plan.this : k => {
    name                = asp.name
    location            = asp.location
    resource_group_name = asp.resource_group_name
  } }
}