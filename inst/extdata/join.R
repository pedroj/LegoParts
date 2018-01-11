library("dplyr")
dleft <- left_join(inventory_parts, inventory_sets, by="inventory_id")
dim(dleft)
## [1] 612618      7
names(dleft)
## [1] "inventory_id" "part_num"     "color_id"     "quantity.x"   "is_spare"
## [6] "set_num"      "quantity.y"
dleft <- left_join(sets, inventory_sets, by="set_num")


dleft01 <- left_join(inventory_parts, inventories, by=c("inventory_id" = "id"))
dim(dleft01)
## [1] 612618      7
names(dleft01)
## [1] "inventory_id" "part_num"     "color_id"     "quantity"     "is_spare"
## [6] "version"      "set_num"

dleft02 <- left_join(dleft01, parts, by="part_num")
dim(dleft02)
## [1] 612618      9
names(dleft02)
## [1] "inventory_id" "part_num"     "color_id"     "quantity"     "is_spare"
## [6] "version"      "set_num"      "name"         "part_cat_id"
