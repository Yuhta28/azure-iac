output "location" {
  value = module.regions.location_cli
}

output "resource_types" {
  value = azurecaf_name.naming_define.results
}

output "app_service_hostname" {
  value = azurerm_linux_web_app.demo_app.default_hostname
}