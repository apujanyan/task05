resource "azurerm_traffic_manager_profile" "this" {
  name                = var.traffic_manager_profile.name
  resource_group_name = var.resource_groups[var.traffic_manager_profile.resource_group_key].name

  traffic_routing_method = var.traffic_manager_profile.routing_method
  profile_status         = "Enabled"

  dns_config {
    relative_name = var.traffic_manager_profile.name
    ttl           = 30
  }

  monitor_config {
    protocol = "HTTP"
    port     = 80
    path     = "/"
  }

  tags = var.tags
}

resource "azurerm_traffic_manager_azure_endpoint" "endpoints" {
  for_each = var.app_services

  name               = each.value.name
  profile_id         = azurerm_traffic_manager_profile.this.id
  target_resource_id = azurerm_windows_web_app.this[each.key].id
  priority           = 1
}

data "azurerm_client_config" "current" {}