output "database_id" {
  description = "The ID of the SQL Database."
  value       = azurerm_mssql_database.database.id
}

output "sql_server_id" {
  description = "The ID of the SQL Server."
  value       = azurerm_mssql_server.sql_server.id
}

output "sql_server_fqdn" {
  description = "The fully qualified domain name of the SQL Server."
  value       = azurerm_mssql_server.sql_server.fully_qualified_domain_name
}

output "database_connection_string" {
  description = "The connection string for the SQL Database."
  value       = "Server=${azurerm_mssql_server.sql_server.fully_qualified_domain_name};Database=${azurerm_mssql_database.database.name};User Id=${var.admin_username};Password=${var.admin_password};"
  sensitive   = true
}
