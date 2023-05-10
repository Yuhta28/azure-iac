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

module "regions" {
  source  = "claranet/regions/azurerm"
  version = "6.1.0"
  
  azure_region = "jp-east"
}