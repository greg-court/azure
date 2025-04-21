variable "management_group_subscription_id" {
  type        = string
  description = "Subscription ID where the management resources (like shared Key Vault) reside"
}

variable "env" {
  type        = string
  description = "Environment name (e.g. dev, prod)"
}

variable "location" {
  type        = string
  description = "Azure location name (e.g. uksouth)"
  default     = "uksouth"
}

variable "loc" {
  type        = string
  description = "Short location code (e.g. uks)"
  default     = "uks"
}

variable "tags" {
  type        = map(string)
  description = "Tags to assign to the resources"
  default     = {}
}