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

variable "subnetname" {
  description = "The name of the subnet."
  type        = string
}

variable "nsgname" {
  description = "The name of the network security group."
  type        = string
}

