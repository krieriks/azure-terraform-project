# Terraform configuration file for the Operaterra backend
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.0.1"
    }
  }

  backend "azurerm" {
    resource_group_name  = "keoperaterra-rg-backend"         
    storage_account_name = "keoperaterrasabackend"            
    container_name       = "keoperaterrasc-backend"           
    key                  = "backend.operaterra.tfstate"       
  }
}
