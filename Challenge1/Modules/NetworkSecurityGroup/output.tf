
output "network_security_group" {
  value = azurerm_network_security_group.nsg.name
}

output "network_security_group_id" {
  value = azurerm_network_security_group.nsg.id
}

