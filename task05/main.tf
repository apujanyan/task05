# Create Resource Groups
module "resource_groups" {
  source   = "./modules/resource_group"
  for_each = var.resource_groups

  name     = each.value.name
  location = each.value.location
  tags     = var.tags
}

# Create App Service Plans
module "app_service_plans" {
  source   = "./modules/app_service_plan"
  for_each = var.app_service_plans

  name                = each.value.name
  resource_group_name = module.resource_groups[each.value.resource_group_key].name
  location            = module.resource_groups[each.value.resource_group_key].location
  os_type             = each.value.os_type
  sku_name            = each.value.sku_name
  worker_count        = each.value.worker_count
  tags                = var.tags

  depends_on = [module.resource_groups]
}

# Create App Services
module "app_services" {
  source   = "./modules/app_service"
  for_each = var.app_services

  name                  = each.value.name
  resource_group_name   = module.resource_groups[each.value.resource_group_key].name
  location              = module.resource_groups[each.value.resource_group_key].location
  service_plan_id       = module.app_service_plans[each.value.app_service_plan_key].id
  verification_agent_ip = each.value.verification_agent_ip
  ip_rule_name          = each.value.ip_rule_name
  tm_rule_name          = each.value.tm_rule_name
  tags                  = var.tags

  depends_on = [module.app_service_plans]
}

# Create Traffic Manager Profile
module "traffic_manager" {
  source = "./modules/traffic_manager"

  name                = var.traffic_manager.name
  resource_group_name = module.resource_groups[var.traffic_manager.resource_group_key].name
  routing_method      = var.traffic_manager.routing_method
  dns_config          = var.traffic_manager.dns_config
  monitor_config      = var.traffic_manager.monitor_config
  tags                = var.tags

  endpoints = [
    {
      name               = "app1-endpoint"
      target_resource_id = module.app_services["app1"].id
      weight             = 100
      priority           = 1
    },
    {
      name               = "app2-endpoint"
      target_resource_id = module.app_services["app2"].id
      weight             = 100
      priority           = 2
    }
  ]

  depends_on = [module.resource_groups, module.app_services]
}