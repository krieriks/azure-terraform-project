resource "azurerm_network_security_group" "nsg" {
  name                = var.nsgname
  location            = var.location
  resource_group_name = var.rgname

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "HTTP"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3000"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnetname
  location            = var.location
  resource_group_name = var.rgname
  address_space       = ["10.0.0.0/16"]

  tags = {
    environment = "OperaTerrake"
  }
}

resource "azurerm_subnet" "main" {
  name                 = "${"main-"}${var.subnetname}"
  resource_group_name  = var.rgname
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "webapp" {
  name                 = "${"webapp-"}${var.subnetname}"
  resource_group_name  = var.rgname
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}