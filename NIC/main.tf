resource "azurerm_network_interface" "nic" {
    for_each = var.NIC
  name                = each.key
  location            = each.value.location
  resource_group_name = each.value.resource_group_name


  ip_configuration {
    name                          = each.value.ipname
    subnet_id                     = data.azurerm_subnet.subnet[each.key].id
    private_ip_address_allocation = each.value.private_ip_address_allocation
  }

}