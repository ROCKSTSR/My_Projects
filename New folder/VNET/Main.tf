resource "azurerm_virtual_network" "example01" {
  for_each            = var.maps_variable
  name                = each.value.VNET
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space
}