output "id" {
  description = "ID of the app service"
  value       = azurerm_windows_web_app.this.id
}

output "name" {
  description = "Name of the app service"
  value       = azurerm_windows_web_app.this.name
}

output "default_hostname" {
  description = "Default hostname of the app service"
  value       = azurerm_windows_web_app.this.default_hostname
}