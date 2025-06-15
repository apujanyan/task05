resource "azurerm_windows_web_app" "this" {
  for_each = var.app_services

  name                = each.value.name
  resource_group_name = var.resource_groups[each.value.resource_group_key].name
  location            = var.resource_groups[each.value.resource_group_key].location
  service_plan_id     = azurerm_app_service_plan.this[each.value.app_service_plan_key].id

  site_config {
    always_on = true

    dynamic "ip_restriction" {
      for_each = [
        {
          name       = "allow-ip"
          ip_address = "${var.allow-ip}/32"
        },
        {
          name        = "allow-tm"
          service_tag = var.allow-tm
        }
      ]

      content {
        name        = ip_restriction.value.name
        ip_address  = try(ip_restriction.value.ip_address, null)
        service_tag = try(ip_restriction.value.service_tag, null)
        action      = "Allow"
        priority    = 100
      }
    }

    ip_restriction_default_action = "Deny"
  }

  tags = var.tags
}