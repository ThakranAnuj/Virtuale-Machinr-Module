

resource "azurerm_virtual_network" "VNET" {
    for_each = var.VNET
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.key
  address_space       =each.value.address_space
  dns_servers         =each.value.dns_servers




}