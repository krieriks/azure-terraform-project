# This file contains the output variables for the storage module.

output "storage_account_name" {
  description = "The name of the storage account."
  value       = azurerm_storage_account.storage_account.name
}

output "container_name" {
  description = "The name of the blob storage container."
  value       = azurerm_storage_container.container.name
}

output "container_url" {
  description = "The URL of the blob storage container."
  value       = azurerm_storage_account.storage_account.primary_blob_endpoint
}
