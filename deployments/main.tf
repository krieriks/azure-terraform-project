# Resource group for the main resources
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
  subnet_id      = module.network.main_subnet_id
}


# Storage module
module "storage" {
  source              = "../modules/storage"
  location            = var.location
  rgname              = azurerm_resource_group.main.name
}

# Public IP for the Load Balancer
resource "azurerm_public_ip" "lb_public_ip" {
  name                = "${local.prefix}-lb-ip-${local.environment}"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  allocation_method   = "Static"
  sku                 = terraform.workspace == "prod" ? "Standard" : "Basic"
}

# Load balancer module
module "load_balancer" {
  source      = "../modules/load_balancer"
  location    = var.location
  rgname      = azurerm_resource_group.main.name
  public_ip_id = azurerm_public_ip.lb_public_ip.id
}
