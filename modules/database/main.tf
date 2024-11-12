# SQL Server
resource "azurerm_mssql_server" "sql_server" {
  name                         = local.database_server_name
  location                     = var.location
  resource_group_name          = var.rgname
  administrator_login          = var.admin_username
  administrator_login_password = var.admin_password
  version                      = "12.0"

  tags = {
    environment = terraform.workspace
  }
}

# SQL Database
resource "azurerm_mssql_database" "database" {
  name        = local.database_name
  server_id   = azurerm_mssql_server.sql_server.id
  collation   = "SQL_Latin1_General_CP1_CI_AS"
  sku_name    = terraform.workspace == "prod" ? "S1" : "Basic"
  max_size_gb = terraform.workspace == "prod" ? 10 : 2

  tags = {
    environment = terraform.workspace
  }
}