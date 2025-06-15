module "resource_groups" {
  source = "./modules/resource_group"

  resource_groups = var.resource_groups
  tags            = var.tags
}

module "app_service_plans" {
  source = "./modules/app_service_plan"

  app_service_plans = var.app_service_plans
  resource_groups   = module.resource_groups.resource_groups
  tags              = var.tags
}

module "app_services" {
  source = "./modules/app_service"

  app_services      = var.app_services
  app_service_plans = module.app_service_plans.app_service_plans
  resource_groups   = module.resource_groups.resource_groups
  allow_ip          = var.allow-ip
  allow_tm          = var.allow-tm
  tags              = var.tags
}

module "traffic_manager" {
  source = "./modules/traffic_manager"

  traffic_manager_profile = var.traffic_manager_profile
  resource_groups         = module.resource_groups.resource_groups
  app_services            = module.app_services.app_services
  tags                    = var.tags
}