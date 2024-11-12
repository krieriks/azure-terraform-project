# Location for the storage resources
variable "location" {
  description = "The Azure region in which to deploy the storage resources."
  type        = string
}

# Resource Group
variable "rgname" {
  description = "The name of the resource group where the storage resources will be deployed."
  type        = string
}
