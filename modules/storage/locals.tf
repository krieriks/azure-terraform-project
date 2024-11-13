
locals {
  prefix                 = "keoperaterra"
  environment_suffix     = terraform.workspace == "dev" ? "dev" : terraform.workspace == "stg" ? "stg" : "prod"
  storage_account_name   = "${local.prefix}sa${local.environment_suffix}"
  container_name         = "${local.prefix}sc${local.environment_suffix}"
}
