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

module "vnet" {
  source  = "Azure/vnet/azurerm"
  version = "4.0.0"
  # insert the 3 required variables here
  resource_group_name = "Test"
  use_for_each = "false"
  vnet_location = var.azure_location

}