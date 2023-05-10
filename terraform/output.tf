output "location" {
  value = module.regions.location_cli
}

output "rg_name" {
  value = azurerm_resource_group.demo.name
}