
resource "azurerm_bastion_host" "bastion" {
    for_each = var.BASTION
  name                = each.key
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = each.value.ip_name
    subnet_id            = data.azurerm_subnet.subnet[each.key].id
    public_ip_address_id = data.azurerm_public_ip.Public_ip[each.key].id
  }
  }    
  
  

  

