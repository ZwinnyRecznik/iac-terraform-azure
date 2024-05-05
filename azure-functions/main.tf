resource "azurerm_resource_group" "example" {
  name     = var.pierwszafunkcja
  location = var.location
}

resource "azurerm_resource_group" "example" {
  name     = var.drugafunkcja
  location = var.location
}

resource "azurerm_storage_account" "example" {
  name                     = var.komendadruga
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}


data "azurerm_service_plan" "example" {
  name                = "existing"
  resource_group_name = "existing"
}

output "id" {
  value = data.azurerm_service_plan.example.id
}


provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = var.funkcjaresource
  location = var.lokacja3
}

resource "azurerm_storage_account" "example" {
  name                     = var.linuxfunkcjatestapki
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "example" {
  name                = var.przyklad_service_plan
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  os_type             = "Linux"
  sku_name            = "Y1"
}



resource "azurerm_linux_function_app" "example" {
  name                = var.example-linux-function-app
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location

  storage_account_name       = azurerm_storage_account.example.name
  storage_account_access_key = azurerm_storage_account.example.primary_access_key
  service_plan_id            = azurerm_service_plan.example.id

  site_config {}
}




resource "azurerm_resource_group" "example" {
  name     = var.azure-functions-test-rg
  location = var.location
}

resource "azurerm_storage_account" "example" {
  name                     = var.functionsapptestsa
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_app_service_plan" "example" {
  name                = var.azure-functions-test-service-plan
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_function_app" "przykladfunkcji" {
  name                       = var.test-azure-functions
  location                   = azurerm_resource_group.przykladfunkcji.location
  resource_group_name        = azurerm_resource_group.przykladfunkcji.name
  app_service_plan_id        = azurerm_app_service_plan.przykladfunkcji.id
  storage_account_name       = azurerm_storage_account.przykladfunkcji.name
  storage_account_access_key = azurerm_storage_account.przykladfunkcji.primary_access_key
}
