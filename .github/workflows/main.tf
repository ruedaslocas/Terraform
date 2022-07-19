# Recomendamos encarecidamente utilizar el bloque required_providers para establecer la
# fuente y versión de Azure Provider que se está utilizando
terraform {

  required_providers {

    azurerm = {
       version = "~>2.30"
    }

    random = {

      source = "hashicorp/random"

    }

  }


  backend "remote" {

    organization = "Azure subscription 1"


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

  name     = "rg-varterraform"
  location = "West Europe"
  */
}

