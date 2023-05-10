provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
  }
}

module "caf" {
  source  = "aztfmod/caf/azurerm"
  version = "5.7.0-preview0"

  global_settings = var.global_settings
  resource_groups = var.resource_groups
  keyvaults       = var.keyvaults

  compute = {
    virtual_machines = var.virtual_machines
  }

  networking = {
    public_ip_addresses = var.public_ip_addresses
    vnets               = var.vnets
  }
}