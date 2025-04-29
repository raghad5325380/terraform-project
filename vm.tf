resource "azurerm_linux_virtual_machine" "chatbot-tf" {
  name                  = "chatbot-vm2"
  resource_group_name   = azurerm_resource_group.main.name
  location              = azurerm_resource_group.main.location
  size                  = "Standard_B1s"
  admin_username        = "azureuser"
  network_interface_ids = [azurerm_network_interface.main.id]

  admin_ssh_key {
    username   = "azureuser"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC+ON3RVvpW+ROWUbSMhte/ZGB0bC1oBvooP3LL5nG5Q9FNKpkcI7BjYNGKD1Daz0CLo54iSoZ1tYbykRlFBE+XJOnKIPlOO5rI31aBxE7L05W0BFCvp+v7OWXKLitRHramljiE67cp3ojvU/wQ3klXh1Odr86G1Kc3/PSivcBFhDbaO+IS/poGiL17zdMlZm4vJJKv5jcrkedcdwJBFbgNWrVz+cU7ZxobuqVBjFLv/ZoSNrwyduJW4icg4H62gE3p4ujTClLgMJUzC+rxTbdL5eIwzYgX6Exv3x8x/Uo4CkNMzfXyHPJHKBmqHd23uuosp/fOYgoIUIJE7vZrGzKFCKGzp7tASGPYdnvO0hNzgnh3yKR615X2UX8gADFJite1WOoXznsyfmLFw0xpLaqBJau3ewNrSIkTbZgDkFYVgDj8pB68IHFUOJtI3mvAdorh5bNnc9AdrFFHK2xnSfm3+S21HKVif/c+jKrMENXIUeQkPM9sPk18sGQ67WG/V161yV4ps1dcdOPn5rrtn2vQdYKAr6ZHigFzOvNVBcMkGkX/IxQ9GdNEHH0WfjxnDWI5yShhafzNi/4xdf+s6IrvGmNlC5Bvx6O7cxAurSvy9N8GBx4zxW4qw/wcmEKLG8Qqx23cDYpOimBQnYD2XsMsw4pGQXZGgllz/txU+NA2iw== raghadmohammed@rghds-MacBook-Pro.local" 
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
