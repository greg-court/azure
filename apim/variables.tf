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

variable "test" {
  type        = string
  description = "testing TF_VAR inheritance from environemnt variables"
}

output "test" {
  value = var.test
}