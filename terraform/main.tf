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

  # Terraform Cloudにstateファイル格納
  cloud {
    organization = "Yuta28"
    workspaces {
      name = "azure-iac"
    }
  }
}

# 東日本リージョン指定
module "regions" {
  source  = "claranet/regions/azurerm"
  version = "6.1.0"

  azure_region = "japaneast"
}