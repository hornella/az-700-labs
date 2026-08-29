resource "azurerm_private_dns_zone" "contoso" {
  name                = "contoso.com"
  resource_group_name = data.azurerm_resource_group.lab.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "contoso_link" {
  name                 = "CoreServicesVnetLink"
  private_dns_zone_id  = azurerm_private_dns_zone.contoso.id
  virtual_network_id   = azurerm_virtual_network.CoreServicesVnet.id
  registration_enabled = true
}
