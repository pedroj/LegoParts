# Joins:
# 0 inventory_parts
# 1 . , inventories
# 2 . , parts
# 3 . , part_categories
# 4 . , colors
# 5 . , sets
# 6 . , themes

library("dplyr")
lego_parts <- left_join(inventory_parts, inventories,
  by=c("inventory_id" = "id")) %>%
  left_join(parts, by="part_num") %>%
  left_join(part_categories, by=c("part_cat_id"="id")) %>%
  rename("part_name"=name.x, "part_category"=name.y) %>%
  left_join(colors, by=c("color_id"="id")) %>%
  rename(color_name="name") %>%
  left_join(sets, by="set_num") %>%
  left_join(themes, by=c("theme_id" = "id")) %>%
  rename("set_name"=name.x, "theme"=name.y)
