# Dispaly all outputs in this file


output "name" {
  value = module.rg.name
}
output "network_security_group_name" {
  value = module.nsg.network_security_group_name
}
output "network_security_group_id" {
  value = module.nsg.network_security_group_id
}

