resource "azurerm_resource_group" "Rgname" {
  for_each = var.maps_variable
  name     = each.value.resource_group_name
  location = each.value.location
}