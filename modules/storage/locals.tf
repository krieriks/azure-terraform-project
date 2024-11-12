# Local variables for environment-specific suffixes and unique naming
locals {
  # Suffix for environment-based resource names
  environment_suffix = terraform.workspace == "dev" ? "-dev" : terraform.workspace == "staging" ? "-stg" : "-prod"

  # Unique resource names with environment suffix
  storage_account_name = "operaterrasa${local.environment_suffix}"
  container_name       = "product-images${local.environment_suffix}"
}
