resource "azurerm_virtual_machine_extension" "rancher_vm_extension" {
  count = "${length(local.vmlist)}"

  location = "westeurope"
  name = "rancher_vm_${element(local.vmlist, count.index)}"
  publisher = "Microsoft.Azure.Extensions"
  resource_group_name = "${azurerm_resource_group.rancher_rg.name}"
  type = "CustomScript"
  type_handler_version = "2.0"
  virtual_machine_name = "${element(azurerm_virtual_machine.rancher_vm.*.name, count.index)}"
  protected_settings = <<SETTINGS
    {
        "fileUris": ["${var.custom_script_url}"],
        "commandToExecute": "sh update-install-yums.sh",
        "storageAccountName": "${var.custom_script_storage_account}",
        "storageAccountKey": "${var.custom_script_storage_access_key}"
    }
SETTINGS

  tags {
    environment = "Rancher Demo"
  }
}