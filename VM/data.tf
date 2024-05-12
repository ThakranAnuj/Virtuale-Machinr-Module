data "azurerm_network_interface" "nic" {
    for_each = var.VM
  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}


data "azurerm_key_vault" "keyvault" {

  name = "jkkey"
  resource_group_name = "JK"
  
}

data "azurerm_key_vault_secret" "user" {
  
  name = "user"
  key_vault_id = data.azurerm_key_vault.keyvault.id
  
}
data "azurerm_key_vault_secret" "password" {
   
  name = "password"
  key_vault_id = data.azurerm_key_vault.keyvault.id
  
}
