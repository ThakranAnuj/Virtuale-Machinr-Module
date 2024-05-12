resource "azurerm_public_ip" "Public_ip" {
    for_each = var.PIP
  name                = each.key
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = each.value.allocation_method
  sku                 = each.value.sku
}
