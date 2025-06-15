resource "azurerm_windows_web_app" "app" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = var.app_service_plan_id
  tags                = var.tags

  site_config {
    always_on = false
    dynamic "ip_restriction" {
      for_each = var.allowed_ips
      content {
        name       = "allow-ip"
        ip_address = ip_restriction.value
        priority   = 100
        action     = "Allow"
      }
    }
    dynamic "ip_restriction" {
      for_each = var.allowed_service_tags
      content {
        name        = "allow-tm"
        service_tag = ip_restriction.value
        priority    = 200
        action      = "Allow"
      }
    }
  }
}