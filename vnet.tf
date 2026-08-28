resource "azurerm_virtual_network" "CoreServicesVnet" {
  name                = "CoreServicesVnet"
  location            = "eastus"
  resource_group_name = data.azurerm_resource_group.lab.name
  address_space       = ["10.20.0.0/16"]
  #dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name             = "GatewaySubnet"
    address_prefixes = ["10.20.0.0/27"]
  }

  subnet {
    name             = "SharedServicesSubnet"
    address_prefixes = ["10.20.10.0/24"]
  }

  subnet {
    name             = "DatabaseSubnet"
    address_prefixes = ["10.20.20.0/24"]
  }

  subnet {
    name             = "PublicWebServiceSubnet"
    address_prefixes = ["10.20.30.0/24"]
  }
}


resource "azurerm_virtual_network" "ManufacturingVnet" {
  name                = "ManufacturingVnet"
  location            = "westus2"
  resource_group_name = data.azurerm_resource_group.lab.name
  address_space       = ["10.30.0.0/16"]

  subnet {
    name             = "ManufacturingSystemSubnet"
    address_prefixes = ["10.30.10.0/24"]
  }

  subnet {
    name             = "SensorSubnet1"
    address_prefixes = ["10.30.20.0/24"]
  }

  subnet {
    name             = "SensorSubnet2"
    address_prefixes = ["10.30.21.0/24"]
  }

  subnet {
    name             = "SensorSubnet3"
    address_prefixes = ["10.30.22.0/24"]
  }

}

resource "azurerm_virtual_network" "ResearchVnet" {
  name                = "ResearchVnet"
  location            = "centralus"
  resource_group_name = data.azurerm_resource_group.lab.name
  address_space       = ["10.40.0.0/16"]

  subnet {
    name             = "ResearchSystemSubnet"
    address_prefixes = ["10.40.0.0/24"]
  }

}

