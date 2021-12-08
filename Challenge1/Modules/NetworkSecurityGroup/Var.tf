# Network Security Group definition



variable "resource_group" {
  description = "Name of the resource group"
  type        = string
}

variable "security_group" {
  description = "Network security group name"
  type        = string
  default     = "nsg"
}

variable "location" {
  description = "Location (Azure Region) for the network security group."
  # No default - if it's not specified, use the resource group location (see main.tf)
  type    = string
  default = ""
}

variable "tags" {
  description = "********************"
  type        = map(string)
  default     = {}
}




# Desccription of  Predefined rules   
variable "predefined_rules" {
  type    = any
  default = []
}

# Destination address prefix to be applied to all predefined rules
variable "source_address_prefixes" {
  type    = list(string)
  default = null
}


# source address prefix to be applied to all predefined rules

variable "source_address_prefix" {
  type    = list(string)
  default = ["*"]
}

# Destination address prefix to be applied to all predefined rules

variable "destination_address_prefix1" {
  type    = list(string)
  default = null
}

# Destination address prefix to be applied to all predefined rules

variable "destination_address_prefix" {
  type    = list(string)
  default = ["*"]
}

