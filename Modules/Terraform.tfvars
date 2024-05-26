maps_variable = {
  VM1 = {
    resource_group_name = "Bitoo"
    location            = "west us"
    VNET                = "BitooVNET"
    address_space       = ["10.0.0.0/16"]
    Subnet              = "Subnet01"
    address_prefixes    = ["10.0.1.0/24"]
    PIP_name            = "PIP_Bitoo"
    NIC_name            = "Nic_Bitoo"
    VM_name             = "Bitoo_VM"


  }
  VM2 = {
    resource_group_name = "Bitoo_09"
    location            = "west us"
    VNET                = "BitooVNET01"
    address_space       = ["10.0.0.0/16"]
    Subnet              = "Subnet01"
    address_prefixes    = ["10.0.1.0/24"]
    PIP_name            = "PIP_Bitoo_01"
    NIC_name            = "Nic_Bitoo_01"
    VM_name             = "Bitoo_VM_2"

}
}

