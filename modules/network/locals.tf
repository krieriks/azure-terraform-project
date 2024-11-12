# Local variables
locals {
  # Suffix to uniquely identify resources per environment
  environment_suffix = terraform.workspace == "dev" ? "-dev" : terraform.workspace == "staging" ? "-stg" : "-prod"

  # Resource names with suffixes to ensure uniqueness
  rg_main_name         = "operaterra-rg${local.environment_suffix}"
  vnet_name            = "operaterra-vnet${local.environment_suffix}"
  subnet_main_name     = "main-subnet${local.environment_suffix}"
  subnet_webapp_name   = "webapp-subnet${local.environment_suffix}"
  nsg_name             = "operaterra-nsg${local.environment_suffix}"
  app_service_name     = "operaterra-app${local.environment_suffix}"
  plan_name            = "operaterra-plan${local.environment_suffix}"
  storage_account_name = "operaterrasa${local.environment_suffix}"
  database_server_name = "operaterra-sql${local.environment_suffix}"
  database_name        = "operaterra-db${local.environment_suffix}"
  load_balancer_name   = "operaterra-lb${local.environment_suffix}"

  # Other configurations
  worker_count = terraform.workspace == "prod" ? 3 : 1
  sku          = terraform.workspace == "prod" ? "P1v2" : "B1"
}
