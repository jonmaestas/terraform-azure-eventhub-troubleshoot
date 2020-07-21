# https://www.terraform.io/docs/providers/azurerm/r/eventhub_namespace_authorization_rule.html
# https://www.terraform.io/docs/providers/azurerm/r/eventhub_authorization_rule.html
resource "azurerm_eventhub_namespace_authorization_rule" "default_manage" {
  name                = lower(join("-", [var.name, "manage"]))
  namespace_name      = azurerm_eventhub_namespace.default.name
  resource_group_name = var.metadata.resource_group.name

  listen = true
  send   = true
  manage = true
}

resource "azurerm_eventhub_namespace_authorization_rule" "default_send" {
  name                = lower(join("-", [var.name, "send"]))
  namespace_name      = azurerm_eventhub_namespace.default.name
  resource_group_name = var.metadata.resource_group.name

  listen = false
  send   = true
  manage = false
}

resource "azurerm_eventhub_namespace_authorization_rule" "default_listen" {
  name                = lower(join("-", [var.name, "listen"]))
  namespace_name      = azurerm_eventhub_namespace.default.name
  resource_group_name = var.metadata.resource_group.name

  listen = true
  send   = false
  manage = false
}