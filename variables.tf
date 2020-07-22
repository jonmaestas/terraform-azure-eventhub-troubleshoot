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
  default = [
    "/subscriptions/XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX/resourceGroups/my-resource-group/providers/Microsoft.Network/virtualNetworks/my_vnet/subnets/subnet1-private-dev",
    "/subscriptions/XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX/resourceGroups/my-resource-group/providers/Microsoft.Network/virtualNetworks/my_vnet/subnets/subnet1-public-dev",
    "/subscriptions/XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX/resourceGroups/my-resource-group/providers/Microsoft.Network/virtualNetworks/my_vnet/subnets/subnet2-private-dev",
    "/subscriptions/XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX/resourceGroups/my-resource-group/providers/Microsoft.Network/virtualNetworks/my_vnet/subnets/subnet2-public-dev"
  ]
}
// variable "virtual_network_rule_1" { }
// variable "virtual_network_rule_2" { }
// variable "virtual_network_rule_3" { }
// variable "virtual_network_rule_4" { }
data "azurerm_resource_group" "default" {
  name = var.resource_group_name
}
