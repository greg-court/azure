terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.26"
    }
  }
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
}