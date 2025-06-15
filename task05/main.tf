provider "azurerm" {
  features {}
}

# Resource Groups
module "resource_group" {
  source   = "./modules/resource_group"
  for_each = var.resource_groups

  name     = each.value.name
  location = each.value.location
  tags     = var.common_tags
}

# App Service Plans
module "app_service_plan" {
  source   = "./modules/app_service_plan"
  for_each = var.app_service_plans

  name                = each.value.name
  location            = module.resource_group[each.value.resource_group_key].location
  resource_group_name = module.resource_group[each.value.resource_group_key].name
  sku                 = each.value.sku
  worker_count        = each.value.worker_count
  tags                = var.common_tags
}

# App Services with Access Restrictions
module "app_service" {
  source   = "./modules/app_service"
  for_each = var.app_services

  name                 = each.value.name
  location             = module.resource_group[each.value.resource_group_key].location
  resource_group_name  = module.resource_group[each.value.resource_group_key].name
  app_service_plan_id  = module.app_service_plan[each.value.app_service_plan_key].id
  allowed_ips          = [var.verification_ip]
  allowed_service_tags = ["AzureTrafficManager"]
  tags                 = var.common_tags
}

# Traffic Manager Endpoints
locals {
  tm_endpoints = [
    {
      name               = "app1-endpoint"
      target_resource_id = module.app_service["app1"].id
      endpoint_location  = module.resource_group["rg1"].location
    },
    {
      name               = "app2-endpoint"
      target_resource_id = module.app_service["app2"].id
      endpoint_location  = module.resource_group["rg2"].location
    }
  ]
}

# Traffic Manager Profile
module "traffic_manager" {
  source = "./modules/traffic_manager"

  profile_name        = var.traffic_manager.profile_name
  resource_group_name = module.resource_group[var.traffic_manager.resource_group_key].name
  routing_method      = var.traffic_manager.routing_method
  endpoints           = local.tm_endpoints
  tags                = var.common_tags
}