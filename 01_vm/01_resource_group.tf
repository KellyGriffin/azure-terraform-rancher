resource "azurerm_resource_group" "rancher_rg" {
  location = "westeurope"
  name = "rancher_rg"
  tags {
    environment = "Rancher Demo"
  }
}