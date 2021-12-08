#Azure SQL Server details

resource "azurerm_sql_database" "db" {
  name                             = var.db_name
  resource_group           = var.resourcegroupname
  location                         = var.location
  edition                          = var.dbedition
  collation                        = var.collation
  server_name                      = var.sqlservername
  create_mode                      = "*****" # define the create mode - Default
  requested_service_objective_name = var.service_objective_name
  tags                             = var.tags
}

# Define the SQL Server parameters 

resource "azurerm_sql_server" "server" {
  name                         = var.db_name}-sqlsvr
  resource_group          = var.resourcegroupname
  location                     = var.location
  version                      = var.server_version
  administrator_login          = var.sql_admin_username
  administrator_login_password = var.sql_password
  tags                         = var.tags
}

# Define the firewall rules for the Azure SQL DB here

resource "azurerm_sql_firewall_rule" "fw" {
  name                = "${var.db_name}-fwrules"
  resource_group = var.resourcegroupname
  server_name         = azurerm_sql_server.server.name
  start_ip_address    = var.start_ip_address
  end_ip_address      = var.end_ip_address
}