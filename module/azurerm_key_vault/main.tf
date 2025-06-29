resource "azurerm_key_vault" "key_vault" {
  name                        = var.key_vault_name
  location                    = var.key_vault_location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = "0c9e6555-c386-4501-b5e5-0aa3197e3cb8"
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = "0c9e6555-c386-4501-b5e5-0aa3197e3cb8"
    object_id = "92d87141-d616-44c6-babf-06da8440e50c"

    

    secret_permissions = [
      "Get","Set","List","Delete","Recover","Purge"
    ]

    
  }
}

resource "azurerm_key_vault_secret" "admin_username" {
  name         = "admin-username"
  value        = var.admin_username
  key_vault_id = azurerm_key_vault.key_vault.id
}

resource "azurerm_key_vault_secret" "admin_password" {
  name         = "admin-password"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.key_vault.id
}