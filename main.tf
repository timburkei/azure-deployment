terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "HdMExample2024Res" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_container_group" "HdMExample2024Res" {
  name                = "example-containergroup"
  location            = azurerm_resource_group.HdMExample2024Res.location
  resource_group_name = azurerm_resource_group.HdMExample2024Res.name
  os_type             = "Linux"

  container {
    name   = "example-container-hdm-2024-mongo"
    image  = "mongo:latest"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 27017
      protocol = "TCP"
    }

    environment_variables = {
      MONGO_INITDB_ROOT_USERNAME = var.mongo_username
      MONGO_INITDB_ROOT_PASSWORD = var.mongo_password
    }
  }

  ip_address_type = "Public"
  dns_name_label  = "mongocontainer"

  tags = {
    environment = "testing"
  }
}
