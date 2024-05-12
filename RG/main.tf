resource "azurerm_resource_group" "RG" {
for_each = var.VNET
  name     = each.key
  location = each.value.location
}