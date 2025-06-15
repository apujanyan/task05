resource "azurerm_traffic_manager_profile" "this" {
  name                   = var.name
  resource_group_name    = var.resource_group_name
  traffic_routing_method = var.routing_method
  tags                   = var.tags

  dns_config {
    relative_name = var.dns_config.relative_name
    ttl           = var.dns_config.ttl
  }

  monitor_config {
    protocol                     = var.monitor_config.protocol
    port                         = var.monitor_config.port
    path                         = var.monitor_config.path
    interval_in_seconds          = 30
    timeout_in_seconds           = 9
    tolerated_number_of_failures = 3
  }
}

resource "azurerm_traffic_manager_azure_endpoint" "endpoints" {
  count              = length(var.endpoints)
  name               = var.endpoints[count.index].name
  profile_id         = azurerm_traffic_manager_profile.this.id
  target_resource_id = var.endpoints[count.index].target_resource_id
  weight             = var.endpoints[count.index].weight
  priority           = var.endpoints[count.index].priority
}