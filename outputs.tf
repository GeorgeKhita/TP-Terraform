output "resource_group_id" {
  description = "ID du Resource Group"
  value       = azurerm_resource_group.rg.id
}

output "vnet_name" {
  description = "Nom du Virtual Network"
  value       = azurerm_virtual_network.vnet.name
}

output "subnet_id" {
  description = "ID du Subnet"
  value       = azurerm_subnet.subnet.id
}

output "lb_public_ip" {
  description = "IP publique du Load Balancer"
  value       = azurerm_public_ip.lb_pip.ip_address
}

output "vm1_public_ip" {
  value = azurerm_public_ip.vm1_pip.ip_address
}

output "vm2_public_ip" {
  value = azurerm_public_ip.vm2_pip.ip_address
}