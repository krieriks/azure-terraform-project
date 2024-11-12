# Location
variable "location" {
  description = "The Azure Region in which all resources in this example should be created."
  type        = string
  default     = "West Europe"
}

# Resource Group
variable "rgname" {
  description = "The name of the Resource Group in which all resources in this example should be created."
  type        = string
}

# Virtual Network
variable "vnetname" {
  description = "The name of the Virtual Network."
  type        = string
}

# Subnet
variable "subnetname" {
  description = "The name of the Subnet."
  type        = string
}

# Network Security Group
variable "nsgname" {
  description = "The name of the Network Security Group."
  type        = string
}
