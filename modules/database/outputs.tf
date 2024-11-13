# Outputs for the database module

# Output the ID of the SQL Database
output "database_id" {
  description = "The ID of the SQL Database."
  value       = azurerm_mssql_database.database.id
}

# Output the name of the SQL Database
output "sql_server_id" {
  description = "The ID of the SQL Server."
  value       = azurerm_mssql_server.sql_server.id
}

# Output the fully qualified domain name of the SQL Server
output "sql_server_fqdn" {
  description = "The fully qualified domain name of the SQL Server."
  value       = azurerm_mssql_server.sql_server.fully_qualified_domain_name
}

# Output the administrator username for the SQL Server
output "sql_server_admin_password" {
  description = "The administrator password for the SQL Server"
  value       = random_password.random_password.result
  sensitive   = true
}

# Output the connection string for the SQL Database
output "database_connection_string" {
  description = "The connection string for the SQL Database."
  value       = "Server=${azurerm_mssql_server.sql_server.fully_qualified_domain_name};Database=${azurerm_mssql_database.database.name};User Id=${var.admin_username};Password=${random_password.random_password.result};"
  sensitive   = true
}
