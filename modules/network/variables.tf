# Location of the resources
variable "location" {
  description = "The Azure Region for the network resources."
  type        = string
}

# Resource Group for the network
variable "rgname" {
  description = "The name of the Resource Group where network resources will be deployed."
  type        = string
}

# Virtual Network name
variable "vnetname" {
  description = "The name of the Virtual Network."
  type        = string
}

# Network Security Group name
variable "nsgname" {
  description = "The name of the Network Security Group."
  type        = string
}

# Main Subnet name
variable "subnet_main_name" {
  description = "The name of the main subnet."
  type        = string
  default     = local.subnet_main_name
}

# Web App Subnet name
variable "subnet_webapp_name" {
  description = "The name of the web app subnet."
  type        = string
  default     = local.subnet_webapp_name
}
