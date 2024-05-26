resource "azurerm_subnet" "Subnet01" {
  for_each             = var.maps_variable
  name                 = each.value.Subnet
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.VNET
  address_prefixes     = each.value.address_prefixes
}