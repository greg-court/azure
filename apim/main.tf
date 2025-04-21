resource "azurerm_resource_group" "apim" {
  name     = "rg-apim-${var.env}-${var.loc}-01"
  location = "uksouth"
}

data "azurerm_key_vault" "apim_shared" {
  provider            = azurerm.management  
  name                = "kv-apim-shared-${var.loc}-01"
  resource_group_name = "rg-kv-shared-${var.loc}-01"
}

data "azurerm_key_vault_secret" "publisher_email" {
  provider     = azurerm.management
  name         = "publisher-email"
  key_vault_id = data.azurerm_key_vault.apim_shared.id
}

resource "azurerm_api_management" "apim_service" {
  name                = "apim-greg-${var.env}-${var.loc}-01"
  location            = var.location
  resource_group_name = azurerm_resource_group.apim.name
  publisher_name      = "Gregorius Industries"
  publisher_email     = data.azurerm_key_vault_secret.publisher_email.value

  sku_name = "Consumption_0"

  tags = var.tags
}

output "apim_service_name" {
  description = "The name of the deployed API Management service."
  value       = azurerm_api_management.apim_service.name
}

output "apim_gateway_url" {
  description = "The gateway URL of the deployed API Management service."
  value       = azurerm_api_management.apim_service.gateway_url
}
