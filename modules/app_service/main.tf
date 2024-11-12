resource "azurerm_service_plan" "app" {
  name                = var.sp_name
  resource_group_name = var.rg_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = "P1v2"
  zone_balancing_enabled = true
  worker_count = var.worker_count
}

resource "azurerm_linux_web_app" "app" {
    name                = var.lwa_name
    location            = azurerm_service_plan.app.location
    resource_group_name = azurerm_service_plan.app.resource_group_name
    service_plan_id = azurerm_service_plan.app.id
    https_only          = true
    client_certificate_enabled = true
    public_network_access_enabled = false

    storage_account {
        name = "${var.sa_name}${"-stg"}"
        access_key = var.saa_key
        account_name = var.sa_name
        type = "AzureBlob"
        share_name = var.sa_share_name
    }

    identity {
        type = "SystemAssigned"
    }

    logs {
      detailed_error_messages = true
        failed_request_tracing = true

        http_logs {
          file_system {
            retention_in_days = 7
            retention_in_mb = 50
          }
        }
    }

    site_config {
        http2_enabled = true
    }
}