# Location
variable "location" {
  description = "The Azure region in which to deploy the load balancer resources."
  type        = string
}

# Resource Group
variable "rgname" {
  description = "The name of the resource group where the load balancer resources will be deployed."
  type        = string
}

# Public IP ID for the load balancer's frontend
variable "public_ip_id" {
  description = "The ID of the Public IP for the load balancer's frontend IP configuration."
  type        = string
}
