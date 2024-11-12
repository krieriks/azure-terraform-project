variable "location" {
  description = "The Azure Region in which all resources in this example should be created."
  type = string
  default     = "West Europe"
}

variable "rgname" {
  description = "The name of the Resource Group in which all resources in this example should be created."
  type = string
}

variable "vnetname" {
  description = "The name of the Virtual Network."
  type = string
}

variable "subnetname" {
  description = "The name of the Subnet."
  type = string
}

variable "nsgname" {
  description = "The name of the Network Security Group."
  type = string
}