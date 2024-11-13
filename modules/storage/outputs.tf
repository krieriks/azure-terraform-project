# This file contains the output variables for the storage module.

# Output storage account name
output "storage_account_name" {
  description = "The name of the storage account."
  value       = azurerm_storage_account.storage_account.name
}

<<<<<<< HEAD
# Output for the storage module
=======
# Output storage account primary access key
>>>>>>> main
output "container_name" {
  description = "The name of the blob storage container."
  value       = azurerm_storage_container.container.name
}

# Output storage account primary blob endpoint
output "container_url" {
  description = "The URL of the blob storage container."
  value       = azurerm_storage_account.storage_account.primary_blob_endpoint
}
