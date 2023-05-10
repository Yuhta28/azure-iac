terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.44.1"
    }
    azurecaf = {
      source  = "aztfmod/azurecaf"
      version = "~> 1.2.11"
    }
  }
  cloud {
    organization = "Yuta28"
    workspaces {
      name = "azure-iac"
    }
  }
}

module "regions" {
  source  = "claranet/regions/azurerm"
  version = "6.1.0"

  azure_region = "japaneast"
}