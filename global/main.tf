resource "azurerm_resource_group" "rg_backend" {
  name     = "${local.prefix}-rg-backend"
  location = local.location
  tags = {
    Environment = "global"
  }
}

resource "azurerm_storage_account" "sa_backend" {
  name                     = "${local.prefix}sabackend"
  resource_group_name      = azurerm_resource_group.rg_backend.name
  location                 = azurerm_resource_group.rg_backend.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    Environment = "global"
  }
}

resource "azurerm_storage_container" "sc_main" {
  name                  = "${local.prefix}sc-backend"
  storage_account_name  = azurerm_storage_account.sa_backend.name
  container_access_type = "private"
}
