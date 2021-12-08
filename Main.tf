# DEclare Azure provider for terraform
provider "azurerm" {
  features {}
}

terraform {
  required_providers {
     azurerm = {
        source = "hashicorp/azurerm"
        version = "~>2.40"
       }
     }

module "Resource Group" {
  source = "modules/resourcegroup"
  name     = var.name
  location = var.location
  tags     = var.tags
}

module "VirtualNetwork" {
  source              = "modules/vnet"
  resource_group_name = module.rg.name
  # enter the address_space
  address_space       = ["10.*.*.*/**"]
  subnet_prefixes     = ["10.*.*.*/**", "10.*.*.*/**", "10.*.*.*/**"]
  subnet_names        = ["SubnetName1", "SubnetName2", "SubnetName2"]
  subnet_service_endpoints = {
    subnet = ["Microsoft.Storage", "Microsoft.Sql"],
    subnet = ["Microsoft.AzureActiveDirectory"]
  }

  tags = {
  #Provide owner name for tagging
	OWNER = "******"
  }

}

# Code to create app service 

module "webapp" {
    count = 3
    source              = "modules/appservice"
    name                = ${var.webappname}-${count.index}
    resource_group = var.resourcegroupname
    plan_settings       = {
                             kind     = "Linux"
                             size     = "**" # provide size
                             capacity = ** # provide capacity
                             tier     = "Standard" # provide tier size
                          }
}

#Create network-security-group for the Subscription

module "network-security-group" {
  source                = "modules/nsg"
  resource_group   = module.rg.name
  location              = var.location
  security_group   = var.security_group_name
  source_address_prefix = var.source_address_prefix	# Provide details
  
  ]

  tags = {
  #Provide owner name for tagging
	OWNER = "******"
  }


# Code to application gateway in the azure subscription

module {
  source = "modules/applicationgateway"
  version = "1.0.0"
}

inputs {
  name                = var.agwname
  resource_group = var.resourcegroupname
  location            = var.location
  subnet_id           = module.vnet.subnet.id

  private_ip_address = var.ipadress

  capacity = {
    min = 1
    max = 2
  }

  zones = ["1", "2", "3"]
}

# Code to create database in the azure subscription

#DatabaseCreation
module "sql-database" {
  source              = "modules/appgateway"
  resource_group = var.resourcegroupname
  location            = var.location
  db_name             = var.dbname
  sql_admin_username  = "**************" # enter admin details
  sql_password        = "**************" # enter password
  tags             = var.tags
  
}
