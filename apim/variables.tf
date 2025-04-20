variable "env" {
  type        = string
  description = "Environment name (e.g. dev, prod)"
}

variable "loc" {
  type        = string
  description = "Short location code (e.g. uks)"
  default     = "uks"
}

variable "location" {
  type        = string
  description = "Azure location name (e.g. uksouth)"
  default     = "uksouth"
}

variable "project_name" {
  type        = string
  description = "Short name for the project"
  default     = "aireviews"
}

variable "tags" {
  type        = map(string)
  description = "Common tags for all resources"
}