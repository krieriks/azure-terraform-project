# Storage Account
resource "azurerm_storage_account" "storage_account" {
  name                     = local.storage_account_name
  location                 = var.location
  resource_group_name      = var.rgname
  account_tier             = "Standard"
  account_replication_type = terraform.workspace == "prod" ? "GRS" : "LRS" # Geo-redundant for prod, locally redundant for others

  tags = {
    environment = terraform.workspace
  }
}

# Blob Storage Container
resource "azurerm_storage_container" "container" {
  name                  = local.container_name
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = "private" # Adjust as needed (e.g., "public-read" for public access)
}
