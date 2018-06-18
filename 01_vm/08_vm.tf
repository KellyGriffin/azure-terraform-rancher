resource "azurerm_availability_set" "rancher_avail_set" {
  location = "westeurope"
  name = "rancher_avail_set"
  managed = true
  resource_group_name = "${azurerm_resource_group.rancher_rg.name}"
  tags {
    environment = "Rancher Demo"
  }
}

resource "azurerm_virtual_machine" "rancher_vm" {
  count = "${length(local.vmlist)}"

  location = "westeurope"
  name = "rancher_vm_${element(local.vmlist, count.index)}"
  network_interface_ids = ["${element(azurerm_network_interface.rancher_nic.*.id, count.index)}"]
  resource_group_name = "${azurerm_resource_group.rancher_rg.name}"
  "storage_os_disk" {
    create_option = "FromImage"
    name = "rancher_vm_${element(local.vmlist, count.index)}_os_disk"
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
    computer_name = "rancher${element(local.vmlist, count.index)}"
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
  availability_set_id = "${substr(element(local.vmlist, count.index), 0, 1) == "m" ? azurerm_availability_set.rancher_avail_set.id : ""}"
  tags {
    environment = "Rancher Demo"
  }
}