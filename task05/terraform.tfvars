resource_groups = {
  rg1 = {
    name     = "cmaz-d4qm9uvw-mod5-rg-01"
    location = "East US"
  }
  rg2 = {
    name     = "cmaz-d4qm9uvw-mod5-rg-02"
    location = "West US"
  }
  rg3 = {
    name     = "cmaz-d4qm9uvw-mod5-rg-03"
    location = "Central US"
  }
}

app_service_plans = {
  asp1 = {
    name               = "cmaz-d4qm9uvw-mod5-asp-01"
    resource_group_key = "rg1"
    os_type            = "Windows"
    sku_name           = "P0v3"
    worker_count       = 2
  }
  asp2 = {
    name               = "cmaz-d4qm9uvw-mod5-asp-02"
    resource_group_key = "rg2"
    os_type            = "Windows"
    sku_name           = "P1v3"
    worker_count       = 1
  }
}

app_services = {
  app1 = {
    name                  = "cmaz-d4qm9uvw-mod5-app-01"
    resource_group_key    = "rg1"
    app_service_plan_key  = "asp1"
    verification_agent_ip = "18.153.146.156"
  }
  app2 = {
    name                  = "cmaz-d4qm9uvw-mod5-app-02"
    resource_group_key    = "rg2"
    app_service_plan_key  = "asp2"
    verification_agent_ip = "18.153.146.156"
  }
}

traffic_manager = {
  name               = "cmaz-d4qm9uvw-mod5-traf"
  resource_group_key = "rg3"
  routing_method     = "Performance"
  dns_config = {
    relative_name = "cmaz-d4qm9uvw-mod5-traf"
    ttl           = 100
  }
  monitor_config = {
    protocol = "HTTPS"
    port     = 443
    path     = "/"
  }
}

tags = {
  Creator = "aramazd_apujanyan@epam.com"
}