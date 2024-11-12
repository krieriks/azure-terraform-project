# App Service Plan
resource "azurerm_app_service_plan" "plan" {
  name                = local.plan_name
  location            = var.location
  resource_group_name = var.rgname
  kind                = "Linux"
  reserved            = true

  sku {
    tier = local.sku
    size = local.sku
  }

  tags = {
    environment = terraform.workspace
  }
}

# Web App
resource "azurerm_app_service" "app" {
  name                = local.app_service_name
  location            = var.location
  resource_group_name = var.rgname
  app_service_plan_id = azurerm_app_service_plan.plan.id

  # Configuration for VNet Integration
  identity {
    type = "SystemAssigned"
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
    "WEBSITES_PORT"                       = "3000"
  }

  tags = {
    environment = terraform.workspace
  }
}