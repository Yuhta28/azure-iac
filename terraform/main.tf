terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.44.1"
    }
  }
  cloud {
    organization = "Yuta28"
    workspaces {
      name = "azure-iac"
    }
  }
}

module "caf" {
    source = "aztfmod/caf/azurerm"
    version = "5.7.0-preview0"

    global_settings = var.global_settings
    resource_groups = var.resource_groups
    providers = {
        azurerm.vhub = azurerm
    }
}