library("dplyr")
dleft <- left_join(inventory_parts, inventory_sets, by="inventory_id")
dim(dleft)
## [1] 612618      7
names(dleft)
## [1] "inventory_id" "part_num"     "color_id"     "quantity.x"   "is_spare"
## [6] "set_num"      "quantity.y"

dleft <- left_join(sets, inventory_sets, by="set_num")
