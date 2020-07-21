variable "resource_group_name" {
  default = "my-resource-group"
 }

variable "name" {
  description = "Name of Namespace"
  default = "my-test"
}
variable "eventhubs" {
  description = "Name of Eventhubs"
  default = ["test1", "test2"]
}
variable "virtual_network_rules" {
}
// variable "virtual_network_rule_1" { }
// variable "virtual_network_rule_2" { }
// variable "virtual_network_rule_3" { }
// variable "virtual_network_rule_4" { }
data "azurerm_resource_group" "default" {
  name = var.resource_group_name
}