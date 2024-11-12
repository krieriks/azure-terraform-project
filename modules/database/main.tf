resource "azurerm_mssql_server" "server_db" {
  name                         = var.db_server_name
  resource_group_name          = var.rg_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
  public_network_access_enabled = false
  minimum_tls_version = "1.2"
}

resource "azurerm_mssql_database" "db" {
  name         = var.db_name
  server_id    = azurerm_mssql_server.server_db.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"
  ledger_enabled = true

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = false
  }
}

resource "azurerm_mssql_database_extended_auditing_policy" "db_audit_policy" {
    database_id = azurerm_mssql_database.db.id
    retention_in_days = 90
    storage_account_access_key = var.saa_key
    storage_account_access_key_is_secondary = false
    storage_endpoint = var.storage_endpoint
}