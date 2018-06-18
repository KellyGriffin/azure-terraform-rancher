# Ranchar 2.0 evaluation on Azure

# Prerequisits
- Azure CLI
- Terraform
- jq

# Building Azure VMs with Terraform
See [Create a complete Linux virtual machine infrastructure in Azure with Terraform](https://docs.microsoft.com/ja-jp/azure/virtual-machines/linux/terraform-create-complete-vm).

# References
- [Terraform Azure Provider Manual](https://www.terraform.io/docs/providers/azurerm/)
- [Terraform Azure Backend](https://www.terraform.io/docs/backends/types/azurerm.html)

## Custom Script for Linux 
- [Terraform Manual](https://www.terraform.io/docs/providers/azurerm/r/virtual_machine_extension.html)
- [GitHub](https://github.com/Azure/custom-script-extension-linux)
- [Stack Overflow (for the old version)](https://stackoverflow.com/questions/48336058/running-a-custom-shell-script-in-azure-vm-using-terraform)

# References in Japanese
- [Terraform によって Azure に完全な Linux 仮想マシンのインフラストラクチャを作成する](https://docs.microsoft.com/ja-jp/azure/virtual-machines/linux/terraform-create-complete-vm)
- [Azure Infrastructure as Code 体験入隊](https://www.slideshare.net/ToruMakabe/azure-infrastructure-as-code)
- [Terraform Bootcamp - Azure Infrastructure as Code隊](https://www.slideshare.net/ToruMakabe/terraform-bootcamp-azure-infrastructure-as-code?next_slideshow=1)

## Azure Storage
- [Azure Storage アカウントの種類](https://docs.microsoft.com/ja-jp/azure/storage/common/storage-account-options)
- [Azure Storage での Azure CLI 2.0 の使用](https://docs.microsoft.com/ja-jp/azure/storage/common/storage-azure-cli)

## Custom Script for Linux
- [Linux 仮想マシンで Azure カスタム スクリプト拡張機能 v2 を使用する](https://docs.microsoft.com/ja-jp/azure/virtual-machines/extensions/custom-script-linux)