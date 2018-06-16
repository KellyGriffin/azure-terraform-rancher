resource "azurerm_public_ip" "rancher_oper_public_ip" {
  location = "westeurope"
  name = "rancher_oper_public_ip"
  public_ip_address_allocation = "dynamic"
  resource_group_name = "${azurerm_resource_group.rancher_rg.name}"
  tags {
    environment = "Rancher Demo"
  }
}