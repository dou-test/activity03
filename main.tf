#provider.tf
provider "azurerm" {
  features {}
}

#terraform.tf
terraform {
  required_providers {
    azurerm = "~> 2.0"
  }
}

data "azurerm_resource_group" "my-rg" {
  name = "Terraform"
}

resource "azurerm_virtual_network" "network" {
  name                = "vnet-terraform-eastus-001"
  address_space       = ["10.0.0.0/16"]
  location            = data.azurerm_resource_group.my-rg.location
  resource_group_name = data.azurerm_resource_group.my-rg.name

  subnet {
    name           = "snet-terraform"
    address_prefix = "10.0.1.0/22"
  }

  subnet {
    name           = "subnet-terraform2"
    address_prefix = "10.0.0.6/24"
  }

}
