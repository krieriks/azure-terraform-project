terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.0.1"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-OperaTerra-ke"
    storage_account_name = "saoperaterrabackendke"
    container_name       = "scoperaterrabackendke"
    key                  = "backend.operaterra.tfstate"
  }
}