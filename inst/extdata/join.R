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

dleft03 <- left_join(dleft02, part_categories, by=c("part_cat_id"="id"))
dim(dleft03)
## [1] 612618      10
names(dleft03)
## [1] "inventory_id" "part_num"     "color_id"     "quantity"     "is_spare"
## [6] "version"      "set_num"      "name.x"       "part_cat_id"  "name.y"
dleft03 <- rename(dleft03, "part_name"=name.x, "part_category"=name.y)
names(dleft03)
## [1] "inventory_id"  "part_num"      "color_id"      "quantity"     
## [5] "is_spare"      "version"       "set_num"       "part_name"    
## [9] "part_cat_id"   "part_category"

dleft04 <- left_join(dleft03, colors, by=c("color_id"="id"))
dim(dleft04)
## [1] 612618     13
names(dleft04)
## [1] "inventory_id"  "part_num"      "color_id"      "quantity"
## [5] "is_spare"      "version"       "set_num"       "part_name"
## [9] "part_cat_id"   "part_category" "name"          "rgb"
## [13] "is_trans"
dleft04 <- rename(dleft04, color_name="name")

