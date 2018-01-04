library("dplyr")
d <- full_join(inventory_parts, inventory_sets, by="inventory_id")
