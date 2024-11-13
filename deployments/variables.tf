variable "subscription_id" {
  description = "The Azure subscription ID."
  type        = string
}

# Resource group variables
variable "rg_main_name" {
  description = "The name of the main resource group."
  type        = string
}

variable "location" {
  description = "The Azure region."
  type        = string
}

# Network variables
variable "vnetname" {
  description = "The name of the virtual network."
  type        = string
}

variable "subnet_main_name" {
  description = "The name of the main subnet."
  type        = string
}

variable "subnet_webapp_name" {
  description = "The name of the web app subnet."
  type        = string
}

variable "nsgname" {
  description = "The name of the network security group."
  type        = string
}

# Database credentials
variable "db_admin_username" {
  description = "The admin username for the database."
  type        = string
}
