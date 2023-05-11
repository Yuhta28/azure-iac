provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
  }
}

provider "azurecaf" {

}

resource "azurecaf_name" "rg_example" {
  name          = "demogroup"
  resource_type = "azurerm_resource_group"
  prefixes      = ["ctf"]
  suffixes      = ["terraform"]
  clean_input   = true
}

resource "azurerm_resource_group" "demo" {
  name     = azurecaf_name.rg_example.result
  location = var.azure_location
}

resource "azurerm_service_plan" "demo_plan" {
  name = azurecaf_name.rg_example.result
  resource_group_name = azurerm_resource_group.demo.name
  location = var.azure_location
  os_type = "Linux"
  sku_name = "F1"
}

resource "azurerm_linux_web_app" "demo_app" {
  name = azurecaf_name.rg_example.result
  location = var.azure_location
  resource_group_name = azurerm_resource_group.demo.name
  service_plan_id = azurerm_service_plan.demo_plan.id

  site_config {
    
  }
}