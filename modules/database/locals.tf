# Local variables for environment-specific suffixes and unique naming
locals {
  # Suffix for environment-based resource names
  environment_suffix = terraform.workspace == "dev" ? "-dev" : terraform.workspace == "staging" ? "-stg" : "-prod"

  # Unique resource names with environment suffix
  database_server_name = "operaterra-sql-server${local.environment_suffix}"
  database_name        = "operaterra-db${local.environment_suffix}"
}
