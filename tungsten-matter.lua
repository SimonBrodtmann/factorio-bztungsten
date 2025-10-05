-- Matter recipes for Krastorio2
if mods["Krastorio2"] then
  local util = require("data-util");
  local matter = require("__Krastorio2__/prototypes/libraries/matter")

  matter.make_recipes({
      material = { type = "item", name = "tungsten-ore", amount = 1 },
      matter_count = 6,
      energy_required = 1,
      need_stabilizer = false,
      unlocked_by_technology = "tungsten-matter-processing",
      icon = {icon = "__bztungsten__/graphics/icons/tungsten-ore.png", icon_size = 64, scale = 1.25}
  })

  matter.make_recipes({
      material = { type = "item", name = "tungsten-plate", amount = 1 },
      matter_count = 10,
      energy_required = 2,
      need_stabilizer = false,
      unlocked_by_technology = "tungsten-matter-processing",
  })
end
