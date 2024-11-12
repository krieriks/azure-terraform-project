terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.0.1"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-OperaTerra-global"           # Global resource group
    storage_account_name = "saoperaterraglobal"             # Global storage account
    container_name       = "scoperaterraglobal"             # Global container
    key                  = "backend.operaterra.${terraform.workspace}.tfstate"  # Separate state per workspace
  }
}
