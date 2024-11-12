locals {
  # Suffix to identify resources per environment
  environment_suffix = terraform.workspace == "dev" ? "-dev" : terraform.workspace == "staging" ? "-stg" : "-prod"

  # Resource names with suffixes
  app_service_name = "operaterra-app${local.environment_suffix}"
  plan_name        = "operaterra-plan${local.environment_suffix}"

  # App Service SKU (different tiers for dev and prod)
  sku = terraform.workspace == "prod" ? "P1v2" : "B1"
}
