resource "azurerm_resource_group" "example" {
  name     = var.name1
  location = var.location1
}

----

resource "azurerm_resource_group" "example" {
  name     = var.name2
  location = var.location2
}

resource "azurerm_storage_account" "example" {
  name                     = var.storageaccountname
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}

----

resource "azurerm_resource_group" "example" {
  name     = var.example-resources
  location = var.location3
}

resource "azurerm_storage_account" "example" {
  name                     = var.examplestoraccount
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "example" {
  name                  = var.vhds
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = "private"
}

----

data "azurerm_storage_blob" "example" {
  name                   = var.example-blob-name
  storage_account_name   = "example-storage-account-name"
  storage_container_name = "example-storage-container-name"
}
