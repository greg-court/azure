resource "azurerm_resource_group" "apim" {
  name     = "rg-apimtest-${var.env}-${var.loc}-01"
  location = "uksouth"
}

data "azurerm_key_vault_secret" "publisher_email" {
  name         = "publisher-email"
  key_vault_id = "/subscriptions/f01a5d70-cf46-4291-80de-336ee2a894d4/resourceGroups/rg-kv-shared-uks-01/providers/Microsoft.KeyVault/vaults/kv-apim-shared-uks-01"
}

resource "azurerm_api_management" "apim_service" {
  name                = "apim-${var.env}-${var.loc}-01"
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
