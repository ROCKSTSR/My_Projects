data "azurerm_subnet" "Subnet01" {
  for_each             = var.maps_variable
  name                 = each.value.Subnet
  virtual_network_name = each.value.VNET
  resource_group_name  = each.value.resource_group_name
}