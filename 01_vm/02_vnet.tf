resource "azurerm_virtual_network" "rancher_vnet" {
  address_space = ["10.0.0.0/16"]
  location = "westeurope"
  name = "rancher_vnet"
  resource_group_name = "${azurerm_resource_group.rancher_rg.name}"
  tags {
    environment = "Rancher Demo"
  }
}