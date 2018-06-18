provider "azurerm" {}

locals {
  vmlist = ["m1", "m2", "m3", "w1", "w2"]
}

variable "custom_script_storage_account" {}
variable "custom_script_storage_access_key" {}
variable "custom_script_url" {}