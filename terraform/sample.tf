provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
  }
}

provider "azurecaf" {

}

resource "azurecaf_name" "naming_define" {
  name           = "demogroup"
  resource_types = ["azurerm_resource_group", "azurerm_app_service_plan", "azurerm_app_service", "azurerm_virtual_network", "azurerm_subnet"]
  prefixes       = ["ctf"]
  suffixes       = ["terraform"]
  random_length  = 3
  clean_input    = true
}

resource "azurerm_resource_group" "demo_rg" {
  name     = values(azurecaf_name.naming_define.results)[2]
  location = var.azure_location
}

resource "azurerm_service_plan" "demo_plan" {
  name                = values(azurecaf_name.naming_define.results)[1]
  resource_group_name = azurerm_resource_group.demo_rg.name
  location            = var.azure_location
  os_type             = "Linux"
  sku_name            = "F1"
}

resource "azurerm_linux_web_app" "demo_app" {
  name                = values(azurecaf_name.naming_define.results)[0]
  location            = var.azure_location
  resource_group_name = azurerm_resource_group.demo_rg.name
  service_plan_id     = azurerm_service_plan.demo_plan.id

  site_config {
    always_on = "false"
  }
}