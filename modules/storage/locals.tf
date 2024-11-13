# Define local variables for the storage module
locals {
  prefix               = "keoperaterra"
  environment_suffix   = terraform.workspace == "dev" ? "dev" : terraform.workspace == "staging" ? "stg" : "prod"
  storage_account_name = "${local.prefix}sa${local.environment_suffix}"
  container_name       = "${local.prefix}sc${local.environment_suffix}"
}
