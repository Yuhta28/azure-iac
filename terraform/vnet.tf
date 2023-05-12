# Deploy Azure Vnet
module "vnet" {
  source  = "Azure/vnet/azurerm"
  version = "4.0.0"

  resource_group_name = azurerm_resource_group.vnet_rg.name
  use_for_each        = false
  vnet_location       = module.regions.location

  address_space   = ["10.1.0.0/16"]
  subnet_prefixes = ["10.1.0.0/24", "10.1.2.0/24", "10.1.3.0/24"]
  subnet_names    = [values(azurecaf_name.vnet_naming.results)[2], values(azurecaf_name.vnet_naming.results)[2], values(azurecaf_name.vnet_naming.results)[2]]
  vnet_name       = values(azurecaf_name.vnet_naming.results)[1]
  tags = {
    "IaC" : "Terraform"
  }
}

resource "azurecaf_name" "vnet_naming" {
  name           = "vnet_nameing"
  resource_types = ["azurerm_resource_group", "azurerm_virtual_network", "azurerm_subnet"]
  prefixes       = ["ctf"]
  suffixes       = ["vnet", "001", "002"]
  random_length  = 3
  clean_input    = true
}

resource "azurerm_resource_group" "vnet_rg" {
  name     = values(azurecaf_name.vnet_naming.results)[0]
  location = module.regions.location
}