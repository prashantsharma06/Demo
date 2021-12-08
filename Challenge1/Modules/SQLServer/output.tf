# Provide output after database creation


output "database_name" {
  description = "Azure SQL Database created with the defined name"
  value       = "${azurerm_sql_database.db.name}"
}

output "sql_server_name" {
  description = "Azure SQL Server created with the defined name"
  value       = "${azurerm_sql_server.server.name}"
}

output "sql_server_location" {
  description = "Location of the SQL Server is :"
  value       = "${azurerm_sql_server.server.location}"
}

output "connection_string" {
  description = "Connection of the database is "
  value       = "Server=tcp:${azurerm_sql_server.server.fully_qualified_domain_name},1433;Initial Catalog=${azurerm_sql_database.db.name};Persist Security Info=False;User ID=${azurerm_sql_server.server.administrator_login};Password=${azurerm_sql_server.server.administrator_login_password};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
}

output "sql_server_version" {
  description = "Version of the database is :"
  value       = "${azurerm_sql_server.server.version}"
}


