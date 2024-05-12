vnet = {
  vk = {

    location = "central india"
    name     = "vnetvk"
    location = "central india"

    address_space = ["10.0.0.0/16"]
    dns_servers   = ["10.0.0.4", "10.0.0.5"]
} }



subnet = {
  subnetfrentend = {
    resource_group_name  = "vk"
    virtual_network_name = "vnetvk"
    address_prefixes     = ["10.0.1.0/24"]
  }

  subnetbackend = {
    resource_group_name  = "vk"
    virtual_network_name = "vnetvk"
  address_prefixes = ["10.0.2.0/24"] }
  AzureBastionSubnet = {
    resource_group_name  = "vk"
    virtual_network_name = "vnetvk"
  address_prefixes = ["10.0.3.0/24"] }

}

nic = {
  nicfrentend = {
    location            = "central india"
    resource_group_name = "vk"
    ipname              = "internal"

    private_ip_address_allocation = "Dynamic"
    subnet_name                   = "subnetfrentend"
    virtual_network_name          = "vnetvk"
    resource_group_name           = "vk"

  }
  nicbackend = {
    location            = "central india"
    resource_group_name = "vk"
    ipname              = "internal"

    private_ip_address_allocation = "Dynamic"
    subnet_name                   = "subnetbackend"
    virtual_network_name          = "vnetvk"
    resource_group_name           = "vk"

  }


}
vm = {
  frontendvm = {
    resource_group_name = "vk"
    nic_name            = "nicfrentend"
    location            = "central india"
    size                = "Standard_F2"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    publisher            = "Canonical"
    offer                = "0001-com-ubuntu-server-jammy"
    sku                  = "22_04-lts"
    version              = "latest"
  }
  backendvm = {
    resource_group_name  = "vk"
    nic_name             = "nicbackend"
    location             = "central india"
    size                 = "Standard_F2"
    admin_username       = "adminuser"
    username             = "adminuser"
    public_key           = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDZooOinf89pl734WJsOPyL2gHcynaohaWJan8F1zdBpHA4chMR+qDB1CMGapE0GZJTANoJtqnJpKubPKvPy1YvvhUKHCZHDkIU1fF01rOsIdcQjneco48Y+hhZFI8rXHgOs3kZS0R6zaoJQfkJmUPlC1f24sNC+koRCp7TTQ4mmX9SVdkzF0NhNb6GFtf/zucF74vduqgVaybgRb2OpJcw++D1WtXTTNOPDVw1wvMqx8psMbfEyezqA/OAXwL1RiPoX7APwdSCywixKkV1hudoLQ590vEtBLQVpRy2q3WsGzml+1Ri4AFyKw9TU9XVjEGhppbm3xV3m5CtL7jSI3nLZe0h6T0TnbHHVb680bjqbSkfRYomodBD0C7zyX+RPprkCgQ2/HVrGSZRbn2SmjVc4vuVCttwVCazGhlYQkH5vO4frJrGAnYMpmfzmz+kTzVaF/Ii3i8/NCafpQHPnxwjXyiH2jfw573uJ7+vDHc4fjAm7ohlywB2ek0WIsviiSk= generated-by-azure"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    publisher            = "Canonical"
    offer                = "0001-com-ubuntu-server-jammy"
    sku                  = "22_04-lts"
    version              = "latest"
  }
}
nsg = {
  nsgfrentend = {
    location                   = "central india"
    resource_group_name        = "vk"
    subnet_name                = "subnetfrentend"
    vnet_name                  = "vnetvk"
    rule_name                  = "test123"
    priority                   = "100"
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  nsgbackend = {
    location                   = "central india"
    resource_group_name        = "vk"
    subnet_name                = "subnetbackend"
    vnet_name                  = "vnetvk"
    rule_name                  = "test123"
    priority                   = "100"
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

}
pip = {
  Pipfrontend = {

    location            = "central india"
    resource_group_name = "vk"
    allocation_method   = "Static"
    sku                 = "Standard"


} }
bastion = {
  bastion1 = {

    location            = "central india"
    resource_group_name = "vk"
    ip_name             = "configuration"
    subnet_name         = "AzureBastionSubnet"
    vnet_name           = "vnetvk"
    Publicip_name       = "Pipfrontend"


} }