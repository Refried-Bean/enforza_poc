resource "azurerm_network_security_group" "allow_ssh" {
  name                = "${var.prefix}-allow-ssh"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

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
}

resource "azurerm_network_interface_security_group_association" "protected" {
  network_interface_id      = azurerm_network_interface.protected.id
  network_security_group_id = azurerm_network_security_group.allow_ssh.id
}

resource "azurerm_network_interface_security_group_association" "firewall" {
  network_interface_id      = azurerm_network_interface.firewall.id
  network_security_group_id = azurerm_network_security_group.allow_ssh.id
}

resource "azurerm_network_interface_security_group_association" "bastion" {
  network_interface_id      = azurerm_network_interface.bastion.id
  network_security_group_id = azurerm_network_security_group.allow_ssh.id
}
