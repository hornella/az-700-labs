resource "azurerm_virtual_network_peering" "peering1to2" {
  name                      = "CoreServicestoManufacturing"
  resource_group_name       = data.azurerm_resource_group.lab.name
  virtual_network_name      = azurerm_virtual_network.CoreServicesVnet.name
  remote_virtual_network_id = azurerm_virtual_network.ManufacturingVnet.id
}

resource "azurerm_virtual_network_peering" "peering2to1" {
  name                      = "ManufacturingtoCoreServices"
  resource_group_name       = data.azurerm_resource_group.lab.name
  virtual_network_name      = azurerm_virtual_network.ManufacturingVnet.name
  remote_virtual_network_id = azurerm_virtual_network.CoreServicesVnet.id
}