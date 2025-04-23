resource "azurerm_linux_virtual_machine" "chatbot-tf" {
  name                  = "chatbot-vm2"
  resource_group_name   = azurerm_resource_group.main.name
  location              = azurerm_resource_group.main.location
  size                  = "Standard_B1s"
  admin_username        = "azureuser"
  network_interface_ids = [azurerm_network_interface.main.id]

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("~/.ssh/id_chatbot_vm.pub") 
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = 30
    name                 = "chatbot-os-disk-2"
  }

source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  disable_password_authentication = true
}