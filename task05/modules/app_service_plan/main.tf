resource "azurerm_app_service_plan" "this" {
  for_each = var.app_service_plans

  name                = each.value.name
  location            = var.resource_groups[each.value.resource_group_key].location
  resource_group_name = var.resource_groups[each.value.resource_group_key].name

  sku {
    tier = "PremiumV3"
    size = each.value.sku
  }

  maximum_elastic_worker_count = each.value.worker_count
  per_site_scaling             = false

  tags = var.tags
}