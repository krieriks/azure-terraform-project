# Outputs for the load balancer module

# Output the ID of the Load Balancer
output "load_balancer_id" {
  description = "The ID of the Load Balancer."
  value       = azurerm_lb.load_balancer.id
}

# Output the ID of the Load Balancer's backend address pool
output "backend_pool_id" {
  description = "The ID of the Load Balancer's backend address pool."
  value       = azurerm_lb_backend_address_pool.backend_pool.id
}

# Output the ID of the Load Balancer's health probe
output "frontend_ip_address" {
  description = "The frontend IP address of the Load Balancer."
  value       = var.public_ip_id
}
