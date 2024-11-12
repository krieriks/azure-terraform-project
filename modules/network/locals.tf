# Local variables for environment-specific suffixes and unique naming
locals {
  # Suffix to uniquely identify resources per environment
  environment_suffix = terraform.workspace == "dev" ? "-dev" : terraform.workspace == "staging" ? "-stg" : "-prod"

  # Resource names with environment suffixes
  rg_main_name       = "operaterra-rg${local.environment_suffix}"
  vnet_name          = "operaterra-vnet${local.environment_suffix}"
  subnet_main_name   = "main-subnet${local.environment_suffix}"
  subnet_webapp_name = "webapp-subnet${local.environment_suffix}"
  nsg_name           = "operaterra-nsg${local.environment_suffix}"
}
