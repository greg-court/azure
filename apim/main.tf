resource "azurerm_resource_group" "test" {
  name     = "rg-apimtest-${var.env}-${var.loc}-01"
  location = "uksouth"
}