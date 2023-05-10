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