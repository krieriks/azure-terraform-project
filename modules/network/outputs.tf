output "vnet_id" {
  description = "The ID of the Virtual Network."
  value       = azurerm_virtual_network.vnet.id
}

output "main_subnet_id" {
  description = "The ID of the main subnet."
  value       = azurerm_subnet.main.id
}

output "webapp_subnet_id" {
  description = "The ID of the web app subnet."
  value       = azurerm_subnet.webapp.id
}

output "nsg_id" {
  description = "The ID of the Network Security Group."
  value       = azurerm_network_security_group.nsg.id
}
