module "rg" {
  source = "../RG"
  VNET   = var.vnet
}
module "vnet" {
  source     = "../Vnet"
  VNET       = var.vnet
  depends_on = [module.rg]
}

module "subnet" {
  source     = "../Subnet"
  SUBNET     = var.subnet
  depends_on = [module.vnet]
}
module "nic" {
  source     = "../NIC"
  NIC        = var.nic
  depends_on = [module.subnet]
}
module "vm" {
  source     = "../VM"
  VM         = var.vm
  depends_on = [module.nic]
}
module "nsg" {
  source     = "../NSG"
  NSG        = var.nsg
  depends_on = [module.subnet]
}
module "Public_ip" {
  source     = "../Public IP"
  PIP        = var.pip
  depends_on = [module.nic]
}
module "Bastion" {
  source     = "../Bastion"
  BASTION    = var.bastion
  depends_on = [module.Public_ip]
}
