resource "azurerm_resource_group" "main" {
  name     = var.rg_main_name
  location = var.location
}

# Netowrk module
module "network" {
  source     = "../modules/network"
  location   = var.location
  rgname     = azurerm_resource_group.main.name
  vnetname   = var.vnetname
  subnetname = var.subnetname
  nsgname    = var.nsgname
}