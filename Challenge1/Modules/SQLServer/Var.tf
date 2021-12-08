# Provide variable information for the SQL Server

variable "resource_group" {
  description = "Resource group name"
  default     = "***"# provide name
}

variable "server_version" {
  description = "Database server version "
  default     = "12.0"
}

variable "location" {
  description = "Location of the SQL Server"
}

variable "db_name" {
  description = "Database name"
}

variable "db_edition" {
  description = "The edition of the database to be created."
  default     = "Basic"
}


variable "sql_admin_username" {
  description = "Admin user name"
}

variable "sql_password" {
  description = "Admin password"
}

variable "start_ip_address" {
  description = "start IP address "
  default     = "0.0.0.0"
}

variable "end_ip_address" {
  description = "end IP address"
  default     = "0.0.0.0"
}

variable "tags" {
  description = "*****************"
  type        = "map"

  default = {
    tag1 = ""
    tag2 = ""
  }
}