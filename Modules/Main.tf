module "Rgname" {
  source        = "../New folder/Resource Group"
  maps_variable = var.maps_variable

}
module "VNET" {
  source        = "../New folder/VNET"
  depends_on    = [module.Rgname]
  maps_variable = var.maps_variable
}
module "Subnet" {
  source        = "../New folder/Subnet"
  depends_on    = [module.VNET]
  maps_variable = var.maps_variable

}

module "VM2" {
  source        = "../New folder/Genric VM"
  depends_on    = [module.Subnet]
  maps_variable = var.maps_variable

}