resource "azurerm_resource_group" "main" {
  name     = "${local.prefix}-rg-${local.environment}"
  location = var.location
}

# Network module
module "network" {
  source     = "../modules/network"
  location   = var.location
  rgname     = azurerm_resource_group.main.name
  vnetname   = "${local.prefix}-vnet-${local.environment}"
  subnetname = "${local.prefix}-subnet-${local.environment}"
  nsgname    = "${local.prefix}-nsg-${local.environment}"
}

# App Service module
module "app_service" {
  source     = "../modules/app_service"
  location   = var.location
  rgname     = azurerm_resource_group.main.name
  app_name   = "${local.prefix}-app-${local.environment}"
}

# Database module
module "database" {
  source            = "../modules/database"
  location          = var.location
  rgname            = azurerm_resource_group.main.name
  db_name           = "${local.prefix}-db-${local.environment}"
  admin_username    = var.db_admin_username
  admin_password    = var.db_admin_password
}

# Storage module
module "storage" {
  source               = "../modules/storage"
  location             = var.location
  rgname               = azurerm_resource_group.main.name
  storage_account_name = "${local.prefix}sa${local.environment}"
}
