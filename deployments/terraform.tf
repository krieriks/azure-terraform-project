terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.0.1"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-OperaTerra-global"           
    storage_account_name = "saoperaterraglobal"             
    container_name       = "scoperaterraglobal"             
    key                  = "backend.operaterra.${terraform.workspace}.tfstate"  
}
}