# Creating the backend resource group
resource "azurerm_resource_group" "rg_backend" {
  name     = var.rg_backend_name
  location = var.rg_backend_location
}

# Creating the backend storage account
resource "azurerm_storage_account" "sa_backend" {
  name                     = var.sa_backend_name
  resource_group_name      = azurerm_resource_group.rg_backend.name
  location                 = azurerm_resource_group.rg_backend.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

# Creating the backend storage container
resource "azurerm_storage_container" "sc_main" {
  name                  = var.sc_backend_name
  storage_account_name  = azurerm_storage_account.sa_backend.name
  container_access_type = "private"
}