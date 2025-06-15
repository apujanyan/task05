resource_groups = {
  rg1 = {
    name     = "cmaz-d4qm9uvw-mod5-rg-01"
    location = "westus"
  },
  rg2 = {
    name     = "cmaz-d4qm9uvw-mod5-rg-02"
    location = "eastus"
  },
  rg3 = {
    name     = "cmaz-d4qm9uvw-mod5-rg-03"
    location = "centralus"
  }
}

app_service_plans = {
  asp1 = {
    name               = "cmaz-d4qm9uvw-mod5-asp-01"
    resource_group_key = "rg1"
    sku                = "P0v3"
    worker_count       = 2
  },
  asp2 = {
    name               = "cmaz-d4qm9uvw-mod5-asp-02"
    resource_group_key = "rg2"
    sku                = "P1v3"
    worker_count       = 1
  }
}

app_services = {
  app1 = {
    name                 = "cmaz-d4qm9uvw-mod5-app-01"
    resource_group_key   = "rg1"
    app_service_plan_key = "asp1"
  },
  app2 = {
    name                 = "cmaz-d4qm9uvw-mod5-app-02"
    resource_group_key   = "rg2"
    app_service_plan_key = "asp2"
  }
}

traffic_manager = {
  profile_name       = "cmaz-d4qm9uvw-mod5-traf"
  resource_group_key = "rg3"
  routing_method     = "Performance"
}

common_tags = {
  Creator = "aramazd_apujanyan@epam.com"
}

verification_ip = "18.153.146.156"