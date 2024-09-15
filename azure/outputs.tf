output "resource_group_name" {
  value = azurerm_resource_group.main.name
}

output "virtual_network_name" {
  value = azurerm_virtual_network.main.name
}

output "subnet_ids" {
  value = {
    for k, v in azurerm_subnet.subnets : k => v.id
  }
}

output "vm_private_ips" {
  value = {
    protected = azurerm_network_interface.protected.private_ip_address
    firewall  = azurerm_network_interface.firewall.private_ip_address
    bastion   = azurerm_network_interface.bastion.private_ip_address
  }
}

output "bastion_public_ip" {
  value = azurerm_public_ip.bastion.ip_address
}

output "firewall_public_ip" {
  value = azurerm_public_ip.firewall.ip_address
}
