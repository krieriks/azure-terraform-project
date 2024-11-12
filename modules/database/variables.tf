variable "db_server_name" {
  description = "The name of the Azure SQL Server"
  type        = string
}

variable "db_name" {
  description = "The name of the Azure SQL Database"
  type        = string
}

variable "administrator_login" {
  description = "The administrator login for the Azure SQL Server"
  type        = string
}

variable "administrator_login_password" {
  description = "The administrator login password for the Azure SQL Server"
  type        = string
  sensitive = true
}

variable "saa_key" {
  description = "The storage account access key"
  type        = string
}

variable "storage_endpoint" {
  description = "The storage account endpoint"
  type        = string
}

variable "rg_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location/region where the resources will be created"
  type        = string
}