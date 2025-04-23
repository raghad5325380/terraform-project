provider "azurerm" {
  features {}
  subscription_id = "8d58f30c-c7a6-4934-a4fb-9cdca24623c2"
}

resource "azurerm_resource_group" "main" {
  name     = "main"
  location = "West US 2"
}