resource "azurerm_subnet" "rancher_k8s_subnet" {
  address_prefix = "10.0.0.0/24"
  name = "rancher_k8s_subnet"
  resource_group_name = "${azurerm_resource_group.rancher_rg.name}"
  virtual_network_name = "${azurerm_virtual_network.rancher_vnet.name}"
}