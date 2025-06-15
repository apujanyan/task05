output "id" {
  description = "ID of the app service plan"
  value       = azurerm_service_plan.this.id
}

output "name" {
  description = "Name of the app service plan"
  value       = azurerm_service_plan.this.name
}