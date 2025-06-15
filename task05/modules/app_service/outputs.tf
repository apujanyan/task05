output "app_services" {
  value = { for k, app in azurerm_windows_web_app.this : k => {
    name                = app.name
    resource_group_name = app.resource_group_name
    location            = app.location
    default_hostname    = app.default_hostname
  } }
}