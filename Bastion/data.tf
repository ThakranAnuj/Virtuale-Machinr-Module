data "azurerm_subnet" "subnet" {
    for_each = var.BASTION
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.resource_group_name
}

  data "azurerm_public_ip" "Public_ip" {
    for_each = var.BASTION
  name                = each.value.Publicip_name
  resource_group_name = each.value.resource_group_name
}
