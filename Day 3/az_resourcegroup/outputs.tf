output "resource_group_names" {
  value = { for rg_name, rg in azurerm_resource_group.example : rg_name => rg.name }
}

output "resource_group_locations" {
  value = { for rg_name, rg in azurerm_resource_group.example : rg_name => rg.location }
}
