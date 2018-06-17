resource "azurerm_network_interface" "rancher_nic" {
  count = "${length(local.vmlist)}"

  "ip_configuration" {
    name = "rancher_${element(local.vmlist, count.index)}_nic_config"
    private_ip_address_allocation = "dynamic"
    subnet_id = "${azurerm_subnet.rancher_k8s_subnet.id}"
    public_ip_address_id = "${element(local.vmlist, count.index) == "m1" ? azurerm_public_ip.rancher_oper_public_ip.id : ""}"
  }
  location = "westeurope"
  name = "rancher_nic_${element(local.vmlist, count.index)}"
  resource_group_name = "${azurerm_resource_group.rancher_rg.name}"
  network_security_group_id = "${element(local.vmlist, count.index) == "m1" ? azurerm_network_security_group.rancher_oper_nsg.id : ""}"
  tags {
    environment = "Rancher Demo"
  }
}