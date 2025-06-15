output "id" {
  description = "ID of the traffic manager profile"
  value       = azurerm_traffic_manager_profile.this.id
}

output "fqdn" {
  description = "FQDN of the traffic manager profile"
  value       = azurerm_traffic_manager_profile.this.fqdn
}

output "name" {
  description = "Name of the traffic manager profile"
  value       = azurerm_traffic_manager_profile.this.name
}