# Location for the database resources
variable "location" {
  description = "The Azure region in which to deploy the database resources."
  type        = string
}

# Resource Group
variable "rgname" {
  description = "The name of the resource group where the database resources will be deployed."
  type        = string
}

# Admin Username
variable "admin_username" {
  description = "The administrator username for the SQL Server."
  type        = string
}


# Optional Subnet ID for VNet Integration
variable "subnet_id" {
  description = "The ID of the subnet to connect the SQL Server for private access (optional)."
  type        = string
  default     = null
}
