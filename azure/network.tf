resource "azurerm_virtual_network" "main" {
  name                = "${var.prefix}-network"
  address_space       = [var.vnet_address_space]
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_subnet" "subnets" {
  for_each = var.subnet_prefixes

  name                 = "${each.key}-subnet"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [each.value]
}

resource "azurerm_route_table" "protected" {
  name                = "${var.prefix}-protected-routes"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  route {
    name                   = "to-firewall"
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = azurerm_network_interface.firewall.private_ip_address
  }
}

resource "azurerm_subnet_route_table_association" "protected" {
  subnet_id      = azurerm_subnet.subnets["protected"].id
  route_table_id = azurerm_route_table.protected.id
}
