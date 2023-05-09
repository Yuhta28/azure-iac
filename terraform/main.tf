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

