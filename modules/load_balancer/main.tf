# Load Balancer
resource "azurerm_lb" "load_balancer" {
  name                = local.load_balancer_name
  location            = var.location
  resource_group_name = var.rgname
  sku                 = terraform.workspace == "prod" ? "Standard" : "Basic"

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = var.public_ip_id
  }

  tags = {
    environment = terraform.workspace
  }
}

# Backend Pool
resource "azurerm_lb_backend_address_pool" "backend_pool" {
  name            = local.backend_pool_name
  loadbalancer_id = azurerm_lb.load_balancer.id
}

# Health Probe
resource "azurerm_lb_probe" "health_probe" {
  name                = local.probe_name
  loadbalancer_id     = azurerm_lb.load_balancer.id
  protocol            = "Tcp"
  port                = 80
  interval_in_seconds = 15
  number_of_probes    = 3
}

# Load Balancing Rule
resource "azurerm_lb_rule" "lb_rule" {
  name                           = local.lb_rule_name
  loadbalancer_id                = azurerm_lb.load_balancer.id
  frontend_ip_configuration_name = "PublicIPAddress"
  probe_id                       = azurerm_lb_probe.health_probe.id
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  idle_timeout_in_minutes        = 4
  enable_floating_ip             = false
}

