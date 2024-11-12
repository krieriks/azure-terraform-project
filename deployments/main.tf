resource "azurerm_resource_group" "main" {
  name     = "${local.prefix}-rg-${local.environment}"
  location = var.location
}

# Network module
module "network" {
  source              = "../modules/network"
  location            = var.location
  rgname              = azurerm_resource_group.main.name
  vnetname            = "${local.prefix}-vnet-${local.environment}"
  subnet_webapp_name  = "${local.prefix}-subnet-webapp-${local.environment}"
  subnet_main_name    = "${local.prefix}-subnet-main-${local.environment}"
  nsgname             = "${local.prefix}-nsg-${local.environment}"
}

# App Service module
module "app_service" {
  source              = "../modules/app_service"
  location            = var.location
  rgname              = azurerm_resource_group.main.name
  subnet_id           = module.network.main_subnet_id
}


# Database module
module "database" {
  source         = "../modules/database"
  location       = var.location
  rgname         = azurerm_resource_group.main.name
  admin_username = var.db_admin_username
  admin_password = var.db_admin_password
  subnet_id      = module.network.main_subnet_id  # Pass subnet for VNet integration if needed
}


# Storage module
module "storage" {
  source              = "../modules/storage"
  location            = var.location
  rgname              = azurerm_resource_group.main.name
}

module "load_balancer" {
  source      = "../modules/load_balancer"
  location    = var.location
  rgname      = azurerm_resource_group.main.name
  public_ip_id = azurerm_public_ip.lb_public_ip.id  # Pass the ID of the public IP assigned to the LB
}
