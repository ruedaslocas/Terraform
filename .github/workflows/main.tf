# Recomendamos encarecidamente utilizar el bloque required_providers para establecer la
# fuente y versión de Azure Provider que se está utilizando
terraform {

  required_providers {

    azurerm = {

    }

    random = {

      source = "hashicorp/random"

    }

  }


  backend "remote" {

    organization = "DemosAzure"


    workspaces {

      name = "AzureAlex"

    }

  }

}


variable "prefix" {

  default = "Minima-v2"

}


provider "azurerm" {

  version = "~>2.30"

  features {}

}

#crear rg
resource "azurerm_resource_group" "rg" {

  #Create a resource group con variables
  name     = var.nombre_grupo
  location = var.localizacion_rg
  /*
  name     = "rg-varterraform"
  location = "West Europe"
  */
}

resource "azurerm_storage_account" "storage_account" {
  name = var.nombre_sa
  #establecemos dependencia con los valores arriba insertados
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_container" "container" {
  #con este for each le metemos los blob desde el fichero variables
  for_each = toset(var.containers)
  name     = each.value

  #en que SA los queremos
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = "private"
}
