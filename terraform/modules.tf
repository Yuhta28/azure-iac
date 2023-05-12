# Deploy Azure Vnet
module "vnet" {
  source  = "Azure/vnet/azurerm"
  version = "4.0.0"

  resource_group_name = azurerm_resource_group.demo_rg.name
  use_for_each        = false
  vnet_location       = module.regions.location

  address_space = ["10.1.0.0/16"]
  subnet_names = [values(azurecaf_name.naming_define.results)[4] + "-a",
    values(azurecaf_name.naming_define.results)[4] + "-b",
    values(azurecaf_name.naming_define.results)[4] + "-c"
  ]
  subnet_prefixes = ["10.1.0.0/24", "10.1.2.0/24", "10.1.3.0/24"]
  vnet_name       = values(azurecaf_name.naming_define.results)[3]
}