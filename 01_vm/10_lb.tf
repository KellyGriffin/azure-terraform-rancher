resource "azurerm_lb" "rancher_master_lb" {
  location = "westeurope"
  name = "rancher_master_lb"
  resource_group_name = "${azurerm_resource_group.rancher_rg.name}"
  sku = "Basic"
  frontend_ip_configuration {
    name = "LoadBalancerFrontEnd"
    subnet_id = "${azurerm_subnet.rancher_k8s_subnet.id}"
    private_ip_address = "10.0.0.200"
    private_ip_address_allocation = "Static"
  }
  tags {
    environment = "Rancher Demo"
  }
}

resource "azurerm_lb_backend_address_pool" "rancher_master_lb_addr_pool" {
  loadbalancer_id = "${azurerm_lb.rancher_master_lb.id}"
  name = "rancher_master_id_addr_pool"
  resource_group_name = "${azurerm_resource_group.rancher_rg.name}"
}

resource "azurerm_lb_probe" "rancher_master_lb_probe_443" {
  loadbalancer_id = "${azurerm_lb.rancher_master_lb.id}"
  name = "rancher_master_lb_probe_443"
  protocol = "Tcp"
  port = 443
  resource_group_name = "${azurerm_resource_group.rancher_rg.name}"
  interval_in_seconds = "15"
  number_of_probes = "2"
}

resource "azurerm_lb_rule" "rancher_master_lb_rule_443" {
  backend_port = 443
  frontend_ip_configuration_name = "LoadBalancerFrontEnd"
  frontend_port = 443
  loadbalancer_id = "${azurerm_lb.rancher_master_lb.id}"
  name = "rancher_master_lb_rule_443"
  protocol = "Tcp"
  resource_group_name = "${azurerm_resource_group.rancher_rg.name}"
  backend_address_pool_id = "${azurerm_lb_backend_address_pool.rancher_master_lb_addr_pool.id}"
}
