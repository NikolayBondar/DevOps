output "resource_group_name" {
  value = azurerm_resource_group.azure-terraform-test.name
}

output "public_ip_address" {
  value = azurerm_windows_virtual_machine.my_terraform_vm.public_ip_address
}
