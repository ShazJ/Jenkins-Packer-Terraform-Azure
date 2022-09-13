variable "environment" {
  default = "development"
}

variable "azure_region" {
  default = "ukwest"
}

variable "sku" {
  default = "Standard_LRS"
}

variable "azure_rg" {
  default = "Test%s%s"
}

resource "azurerm_resource_group" "resource_group" {
  name     = format(var.azure_rg, var.azure_region, var.environment)
  location = var.azure_region

    tags = {
    environment = var.environment
  }
}

resource "azurerm_managed_disk" "storage_account" {
  name                 = "imageStore"
  location             = azurerm_resource_group.resource_group.location
  resource_group_name  = azurerm_resource_group.resource_group.name
  storage_account_type = var.sku
  create_option        = "Empty"
  disk_size_gb         = "1"
}