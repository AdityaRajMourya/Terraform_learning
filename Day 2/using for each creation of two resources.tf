terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
}

# Define the resource group names and locations
variable "resource_groups" {
  default = {
    rg1 = {
      name     = "resource-group-1"
      location = "East US"
    }
    rg2 = {
      name     = "resource-group-2"
      location = "West US"
    }
  }
}

# Create resource groups
resource "azurerm_resource_group" "example" {
  for_each = var.resource_groups

  name     = each.value["name"]
  location = each.value["location"]
}

variable "storage_accounts" {
  default = {
    storage1 = {
      name                     = "urstore12457" // Adjusted name to ensure uniqueness
      resource_group           = "rg1"
      account_tier             = "Standard"
      account_replication_type = "LRS"
    }
    storage2 = {
      name                     = "urstooooore1245789" // Adjusted name to ensure uniqueness
      resource_group           = "rg2"
      account_tier             = "Standard"
      account_replication_type = "LRS"
    }
  }
}

# Create storage accounts
resource "azurerm_storage_account" "example" {
  for_each = var.storage_accounts

  name                     = each.value["name"]
  resource_group_name      = azurerm_resource_group.example[each.value["resource_group"]].name
  location                 = azurerm_resource_group.example[each.value["resource_group"]].location
  account_tier             = each.value["account_tier"]
  account_replication_type = each.value["account_replication_type"]

  account_kind = "StorageV2"

}
