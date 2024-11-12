variable "sp_name" {
  description = "The name of the service plan"
  type        = string
}

variable "rg_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the resource group"
  type        = string
}

variable "worker_count" {
  description = "The number of workers"
  type        = number
}

variable "lwa_name" {
  description = "The name of the linux web app"
  type        = string
}

variable "sa_name" {
  description = "The name of the storage account"
  type        = string
}

variable "saa_key" {
  description = "The access key of the storage account"
  type        = string
}   

variable "sa_share_name" {
  description = "The name of the storage account share"
  type        = string
}