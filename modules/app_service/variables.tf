# Location
variable "location" {
  description = "The Azure region in which to deploy the app service."
  type        = string
}

# Resource Group
variable "rgname" {
  description = "The name of the resource group in which to create the app service resources."
  type        = string
}

# Subnet ID for VNet Integration
variable "subnet_id" {
  description = "The ID of the subnet for the App Service to connect to (optional for private access)."
  type        = string
}
