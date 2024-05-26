resource "azurerm_public_ip" "PIP_02" {
  for_each            = var.maps_variable
  name                = each.value.PIP_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = "Static"
}
resource "azurerm_network_interface" "NIC_02" {
  for_each            = var.maps_variable
  name                = each.value.NIC_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.Subnet01[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_virtual_machine" "VM2" {
  for_each              = var.maps_variable
  name                  = each.value.VM_name
  location              = each.value.location
  resource_group_name   = each.value.resource_group_name
  network_interface_ids = [azurerm_network_interface.NIC_02[each.key].id]
  vm_size               = "Standard_DS1_v2"
  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "youosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}