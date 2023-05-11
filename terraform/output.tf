output "location" {
  value = module.regions.location_cli
}

output "resource_types" {
  value = azurecaf_name.naming_define.results
}