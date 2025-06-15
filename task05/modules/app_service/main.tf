resource "azurerm_windows_web_app" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = var.service_plan_id
  tags                = var.tags

  site_config {
    always_on = true

    dynamic "ip_restriction" {
      for_each = [
        {
          name       = var.ip_rule_name
          ip_address = "${var.verification_agent_ip}/32"
          action     = "Allow"
          priority   = 100
        },
        {
          name        = var.tm_rule_name
          service_tag = "AzureTrafficManager"
          action      = "Allow"
          priority    = 200
        }
      ]
      content {
        name        = ip_restriction.value.name
        ip_address  = lookup(ip_restriction.value, "ip_address", null)
        service_tag = lookup(ip_restriction.value, "service_tag", null)
        action      = ip_restriction.value.action
        priority    = ip_restriction.value.priority
      }
    }

    ip_restriction_default_action = "Deny"
  }
}