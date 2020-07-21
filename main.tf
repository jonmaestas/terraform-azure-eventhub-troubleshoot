# https://www.terraform.io/docs/providers/azurerm/r/eventhub_namespace.html
resource "azurerm_eventhub_namespace" "default" {
  name              = lower(join("-", ["eh", var.name, var.metadata.stage, var.metadata.location]))
  location                 = data.azurerm_resource_group.default.location
  resource_group_name      = data.azurerm_resource_group.default.name
  sku                      = "Standard"
  capacity                 = 1
  maximum_throughput_units = 20
  auto_inflate_enabled     = true

  network_rulesets {
    default_action    = "Deny"
    
    ############
    # Option 1 #
    ############
    # for_each = var.virtual_network_rules
    # content {
    #   virtual_network_rule {
    #     subnet_id = network_rulesets.value
    #   }
    # }

    dynamic virtual_network_rule {
    for_each = sort(virtual_network_rules)
    content {
        subnet_id = virtual_network_rule.value
      }
    }

// #### WORKS ####
//     virtual_network_rule {
//       subnet_id = var.virtual_network_rule_1
//     }

//     virtual_network_rule {
//       subnet_id = var.virtual_network_rule_2
//     }

//     virtual_network_rule {
//       subnet_id = var.virtual_network_rule_3
//     }

//     virtual_network_rule {
//       subnet_id = var.virtual_network_rule_4
//     }
// #### END WORKS ####
    ############
    # Option 2 #
    ############
    # for_each = var.virtual_network_rules
    # {
    #   virtual_network_rule = {
    #     subnet_id = each.value
    #   }
    # }
  }

  lifecycle {
    ignore_changes = [
      capacity
    ]
  }
}