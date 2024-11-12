# Local variables for environment-specific suffixes and unique naming
locals {
  # Suffix to identify resources per environment
  environment_suffix = terraform.workspace == "dev" ? "-dev" : terraform.workspace == "staging" ? "-stg" : "-prod"

  # Unique resource names with environment suffix
  load_balancer_name = "operaterra-lb${local.environment_suffix}"
  backend_pool_name  = "operaterra-bepool${local.environment_suffix}"
  probe_name         = "operaterra-healthprobe${local.environment_suffix}"
  lb_rule_name       = "operaterra-lbrule${local.environment_suffix}"
}
