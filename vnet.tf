resource "azurerm_virtual_network" "CoreServicesVnet" {
  name                = "CoreServicesVnet"
  location            = "eastus"
  resource_group_name = data.azurerm_resource_group.lab.name
  address_space       = ["10.20.0.0/16"]
  #dns_servers         = ["10.0.0.4", "10.0.0.5"]

}

resource "azurerm_subnet" "GatewaySubnet" {
  name                 = "GatewaySubnet"
  resource_group_name  = data.azurerm_resource_group.lab.name
  virtual_network_name = azurerm_virtual_network.CoreServicesVnet.name
  address_prefixes     = ["10.20.0.0/27"]
}

resource "azurerm_subnet" "SharedServicesSubnet" {
  name                 = "SharedServicesSubnet"
  resource_group_name  = data.azurerm_resource_group.lab.name
  virtual_network_name = azurerm_virtual_network.CoreServicesVnet.name
  address_prefixes     = ["10.20.10.0/24"]
}

resource "azurerm_subnet" "DatabaseSubnet" {
  name                 = "DatabaseSubnet"
  resource_group_name  = data.azurerm_resource_group.lab.name
  virtual_network_name = azurerm_virtual_network.CoreServicesVnet.name
  address_prefixes     = ["10.20.20.0/24"]
}

resource "azurerm_subnet" "PublicWebServiceSubnet" {
  name                 = "PublicWebServiceSubnet"
  resource_group_name  = data.azurerm_resource_group.lab.name
  virtual_network_name = azurerm_virtual_network.CoreServicesVnet.name
  address_prefixes     = ["10.20.30.0/24"]
}



resource "azurerm_virtual_network" "ManufacturingVnet" {
  name                = "ManufacturingVnet"
  location            = "westus2"
  resource_group_name = data.azurerm_resource_group.lab.name
  address_space       = ["10.30.0.0/16"]

}

resource "azurerm_subnet" "ManufacturingSystemSubnet" {
  name                 = "ManufacturingSystemSubnet"
  resource_group_name  = data.azurerm_resource_group.lab.name
  virtual_network_name = azurerm_virtual_network.ManufacturingVnet.name
  address_prefixes     = ["10.30.10.0/24"]
}

resource "azurerm_subnet" "SensorSubnet1" {
  name                 = "SensorSubnet1"
  resource_group_name  = data.azurerm_resource_group.lab.name
  virtual_network_name = azurerm_virtual_network.ManufacturingVnet.name
  address_prefixes     = ["10.30.20.0/24"]
}

resource "azurerm_subnet" "SensorSubnet2" {
  name                 = "SensorSubnet2"
  resource_group_name  = data.azurerm_resource_group.lab.name
  virtual_network_name = azurerm_virtual_network.ManufacturingVnet.name
  address_prefixes     = ["10.30.21.0/24"]
}

resource "azurerm_subnet" "SensorSubnet3" {
  name                 = "SensorSubnet3"
  resource_group_name  = data.azurerm_resource_group.lab.name
  virtual_network_name = azurerm_virtual_network.ManufacturingVnet.name
  address_prefixes     = ["10.30.22.0/24"]
}

resource "azurerm_virtual_network" "ResearchVnet" {
  name                = "ResearchVnet"
  location            = "centralus"
  resource_group_name = data.azurerm_resource_group.lab.name
  address_space       = ["10.40.0.0/16"]
}

resource "azurerm_subnet" "ResearchSystemSubnet" {
  name                 = "ResearchSystemSubnet"
  resource_group_name  = data.azurerm_resource_group.lab.name
  virtual_network_name = azurerm_virtual_network.ResearchVnet.name
  address_prefixes     = ["10.40.0.0/24"]
}


