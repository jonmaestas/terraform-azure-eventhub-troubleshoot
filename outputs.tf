output "namespace" {
  value = azurerm_eventhub_namespace.default
}

output "authorization_rule_manage" {
  value     = azurerm_eventhub_namespace_authorization_rule.default_manage
  sensitive = true
}

output "authorization_rule_send" {
  value     = azurerm_eventhub_namespace_authorization_rule.default_send
  sensitive = true
}

output "authorization_rule_listen" {
  value     = azurerm_eventhub_namespace_authorization_rule.default_listen
  sensitive = true
}