resource "azurerm_virtual_machine" "rancher_vm_o1" {
  location = "westeurope"
  name = "rancher_vm_o1"
  network_interface_ids = ["${azurerm_network_interface.rancher_nic_o1.id}"]
  resource_group_name = "${azurerm_resource_group.rancher_rg.name}"
  "storage_os_disk" {
    create_option = "FromImage"
    name = "rancher_vm_o1_os_disk"
    caching = "ReadWrite"
    managed_disk_type = "Standard_LRS"
  }
  storage_image_reference {
    publisher = "OpenLogic"
    offer = "CentOS"
    sku = "7.3"
    version = "latest"
  }
  os_profile {
    admin_username = "radmin"
    computer_name = "rancherm1"
  }
  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
      path = "/home/radmin/.ssh/authorized_keys"
      key_data = "${file("nogit/id_rsa.pub")}"
    }
  }
  boot_diagnostics {
    enabled = true
    storage_uri = "${azurerm_storage_account.rancher_storage_account.primary_blob_endpoint}"
  }
  vm_size = "Standard_B2s"
  tags {
    environment = "Rancher Demo"
  }
}