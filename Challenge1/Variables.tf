# Describe variable inputs in this file

#1. Describe resource group name

variable "name" {
  description = "Resource Group Name"
  type        = string

}

#2. Describe location variable

variable "location" {
  description = "Resource Group Location"
  type        = string
}

#3. Describe Tagging info her

variable "tags" {
  description = "Tagging information to be provided here "
  type        = map(string)
  default     = {}
}