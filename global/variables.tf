variable "rg_backend_name" {
  description = "The name of the resource group in which to create the resources."
  type        = string
}

variable "rg_backend_location" {
  description = "The location/region where the resource group will be created."
  type        = string
  default     = "West Europe"
}

variable "sa_backend_name" {
  description = "The name of the storage account to create."
  type        = string
}

variable "sc_backend_name" {
  description = "The name of the storage container to create."
  type        = string
}

variable "subscription_id" {
  description = "The Azure subscription ID."
  type        = string
}