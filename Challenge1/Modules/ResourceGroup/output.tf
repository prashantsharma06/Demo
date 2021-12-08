
# provide output for the resource group parameters

output "id" {
  description = "Name of the Resource Group id"
  value       = azurerm_resource_group.rg.id
}


output "name" {
  description = "Name of the resource group"
  value       = azurerm_resource_group.rg.name
}



output "tags" {
  description = "Name of the resouce group tags"
  value       = azurerm_resource_group.rg.tags
}

output "location" {
  description = "Name of the resource group location"
  value       = azurerm_resource_group.rg.location
}

