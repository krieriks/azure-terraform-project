variable "rg_backend_location" {
  description = "The location/region for global resources."
  type        = string
  default     = "West Europe"
}

variable "prefix" {
  description = "Prefix for naming global resources."
  type        = string
  default     = "keoperaterra"
}

variable "subscription_id" {
  description = "The Azure subscription ID."
  type        = string
}
