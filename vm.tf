resource "azurerm_public_ip" "testvm1-pip" {
  name                = "testvm1-pip"
  resource_group_name = data.azurerm_resource_group.lab.name
  location            = data.azurerm_resource_group.lab.location
  allocation_method   = "Static"

  tags = {
    environment = "az-700-labs"
  }
}

resource "azurerm_network_interface" "testvm1-nic" {
  name                = "testvm1-nic"
  location            = data.azurerm_resource_group.lab.location
  resource_group_name = data.azurerm_resource_group.lab.name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.DatabaseSubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.testvm1-pip.id
  }
}

resource "azurerm_network_interface_security_group_association" "testvm1_nsg_assoc" {
  network_interface_id      = azurerm_network_interface.testvm1-nic.id
  network_security_group_id = azurerm_network_security_group.testvm1-nsg.id
}


resource "azurerm_windows_virtual_machine" "testvm1" {
  name                = "testvm1"
  resource_group_name = data.azurerm_resource_group.lab.name
  location            = data.azurerm_resource_group.lab.location
  size                = var.vm_size
  admin_username      = var.vm_username
  admin_password      = var.vm_password
  network_interface_ids = [
    azurerm_network_interface.testvm1-nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter-gensecond"
    version   = "latest"
  }
}


resource "azurerm_public_ip" "testvm2-pip" {
  name                = "testvm2-pip"
  resource_group_name = data.azurerm_resource_group.lab.name
  location            = data.azurerm_resource_group.lab.location
  allocation_method   = "Static"

  tags = {
    environment = "az-700-labs"
  }
}

resource "azurerm_network_interface" "testvm2-nic" {
  name                = "testvm2-nic"
  location            = data.azurerm_resource_group.lab.location
  resource_group_name = data.azurerm_resource_group.lab.name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.DatabaseSubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.testvm2-pip.id
  }
}

resource "azurerm_network_interface_security_group_association" "testvm2_nsg_assoc" {
  network_interface_id      = azurerm_network_interface.testvm2-nic.id
  network_security_group_id = azurerm_network_security_group.testvm2-nsg.id
}

resource "azurerm_windows_virtual_machine" "testvm2" {
  name                = "testvm2"
  resource_group_name = data.azurerm_resource_group.lab.name
  location            = data.azurerm_resource_group.lab.location
  size                = var.vm_size
  admin_username      = var.vm_username
  admin_password      = var.vm_password
  network_interface_ids = [
    azurerm_network_interface.testvm2-nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter-gensecond"
    version   = "latest"
  }
}

resource "azurerm_public_ip" "ManufacturingVM-pip" {
  name                = "ManufacturingVM-pip"
  resource_group_name = data.azurerm_resource_group.lab.name
  location            = azurerm_virtual_network.ManufacturingVnet.location
  allocation_method   = "Static"

  tags = {
    environment = "az-700-labs"
  }
}

resource "azurerm_network_interface" "ManufacturingVM-nic" {
  name                = "ManufacturingVM-nic"
  location            = azurerm_virtual_network.ManufacturingVnet.location
  resource_group_name = data.azurerm_resource_group.lab.name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.ManufacturingSystemSubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.ManufacturingVM-pip.id
  }
}

resource "azurerm_network_interface_security_group_association" "ManufacturingVM_nsg_assoc" {
  network_interface_id      = azurerm_network_interface.ManufacturingVM-nic.id
  network_security_group_id = azurerm_network_security_group.ManufacturingVM-nsg.id
}


resource "azurerm_windows_virtual_machine" "ManufacturingVM" {
  name                = "ManufacturingVM"
  resource_group_name = data.azurerm_resource_group.lab.name
  location            = azurerm_virtual_network.ManufacturingVnet.location
  size                = var.vm_size
  admin_username      = var.vm_username
  admin_password      = var.vm_password
  network_interface_ids = [
    azurerm_network_interface.ManufacturingVM-nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter-gensecond"
    version   = "latest"
  }
}