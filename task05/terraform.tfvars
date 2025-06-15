resource_groups = {
  rg1 = {
    name     = "cmaz-d4qm9uvw-mod5-rg-01"
    location = "West Europe"
  }
  rg2 = {
    name     = "cmaz-d4qm9uvw-mod5-rg-02"
    location = "North Europe"
  }
  rg3 = {
    name     = "cmaz-d4qm9uvw-mod5-rg-03"
    location = "East US"
  }
}

app_service_plans = {
  asp1 = {
    name               = "cmaz-d4qm9uvw-mod5-asp-01"
    worker_count       = 2
    sku                = "P0v3"
    resource_group_key = "rg1"
  }
  asp2 = {
    name               = "cmaz-d4qm9uvw-mod5-asp-02"
    worker_count       = 1
    sku                = "P1v3"
    resource_group_key = "rg2"
  }
}

app_services = {
  app1 = {
    name                 = "cmaz-d4qm9uvw-mod5-app-01"
    app_service_plan_key = "asp1"
    resource_group_key   = "rg1"
  }
  app2 = {
    name                 = "cmaz-d4qm9uvw-mod5-app-02"
    app_service_plan_key = "asp2"
    resource_group_key   = "rg2"
  }
}

traffic_manager_profile = {
  name               = "cmaz-d4qm9uvw-mod5-traf"
  routing_method     = "Performance"
  resource_group_key = "rg3"
}

tags = {
  Creator = "aramazd_apujanyan@epam.com"
}

allow_ip = "18.153.146.156"
allow_tm = "AzureTrafficManager"