# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
}

# Define variables
variable "resource_group_names" {
  type    = list(string)
  default = ["rg1", "rg2"] # Names of the resource groups
}

# Define variables
variable "azurerm_storage_account" {
  type    = list(string)
  default = ["mystore1457", "mystore124578"] # Names of the resource groups
}

resource "azurerm_resource_group" "myrg" {
  count    = 2
  name     = var.resource_group_names[count.index]
  location = count.index % 2 == 0 ? "westus2" : "West Europe"
}

resource "azurerm_storage_account" "mystorage" {
  count                    = 2
  name                     = var.azurerm_storage_account[count.index]
  resource_group_name      = azurerm_resource_group.myrg[count.index].name
  location                 = azurerm_resource_group.myrg[count.index].location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
