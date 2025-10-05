-- Tungsten smelting

local util = require("data-util");

data:extend({
  { type = "recipe-category", name = "smelting-carbon"},
})

if not mods.bobplates then
data:extend({
  {
    type = "item",
    name = "tungsten-carbide",
    icon = "__bztungsten__/graphics/icons/tungsten-carbide.png",
    icon_size = 128,
    subgroup = "raw-material",
    order = "z[tungsten-carbide]",
    stack_size = 100
  },
  {
    type = "item",
    name = util.me.tungsten_plate,
    icon = "__bztungsten__/graphics/icons/tungsten-plate.png",
    icon_size = 128, icon_mipmaps = 3,
    subgroup = "raw-material",
    order = "b[tungsten-plate]",
    stack_size = 100
  }
})
end

data:extend({
  {
    type = "recipe",
    name = util.me.tungsten_plate,
    --main_product = util.me.tungsten_plate,
    category = "smelting",
    order = "d[tungsten-plate]",
    icons = (mods["Krastorio2"] and {
          { icon = "__bztungsten__/graphics/icons/tungsten-plate.png", icon_size = 128, icon_mipmaps = 3, },
          { icon = "__bztungsten__/graphics/icons/tungsten-ore.png", icon_size = 64, icon_mipmaps = 3, scale=0.25, shift= {-8, -8}},
        } or mods.bobplates and {
          { icon = "__bobplates__/graphics/icons/plate/tungsten-plate.png", icon_size = 32},
        } or
        {
          { icon = "__bztungsten__/graphics/icons/tungsten-plate.png", icon_size = 128},
        }),
    enabled = false,
    energy_required = mods["Krastorio2"] and 24 or 32/15,
    ingredients = {{type="item", name="tungsten-ore", amount=mods["Krastorio2"] and 15 or (mods.bobplates and 4 or 2)}},
    results = {{type="item", name=util.me.tungsten_plate, amount=mods["Krastorio2"] and 5 or 1}}
  },
  {
    type = "technology",
    name = util.me.tungsten_processing,
    icons = {{ icon =
      mods.bobplates
      and "__bobplates__/graphics/icons/technology/tungsten-processing.png"
      or "__bztungsten__/graphics/technology/tungsten-processing.png",
      icon_size = mods.bobplates and 64 or 256,
    }},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = util.me.tungsten_plate
      },
      {
        type =  "unlock-recipe",
        recipe = util.me.tungsten_carbide_recipe,
      },
      mods["TheBigFurnace"] and {
        type = "unlock-recipe",
        recipe = "big-tungsten-plate",
      } or nil,
    },
    unit =
    {
      count = 75,
      ingredients = 
          {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1}
          },
      time = 30,
    },
    prerequisites = {"advanced-material-processing"},
    order = "b-b"
  },
  mods["TheBigFurnace"] and {
    type = "recipe",
    name = "big-tungsten-plate",
    icons = { { icon = "__bztungsten__/graphics/icons/tungsten-plate.png", icon_size = 128 }, },
    subgroup = "raw-material",
    category = "big-smelting",
    order = "d[tungsten-plate]",
    enabled = false,
    energy_required = 6, --TODO
    ingredients = {{type="item", name="tungsten-ore", amount=100}},
    results = {{type="item", name = util.me.tungsten_plate, amount=50}}
  } or nil,
})

if mods["aai-industry"] and not data.raw.technology["pumpjack"] then
data:extend({
  {
    type = "technology",
    name = "pumpjack",
    icons = {
      { icon = data.raw.technology["oil-processing"].icon, icon_size=data.raw.technology["oil-processing"].icon_size },
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "pumpjack",
      },
    },
    unit =
    {
      count = 25,
      ingredients = 
          {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1}
          },
      time = 30,
    },
    prerequisites = {"fluid-handling"},
    order = "b-b",
  },
})
end

data:extend({
  {
    type = "recipe",
    name = util.me.tungsten_carbide_recipe,
    --main_product = util.me.tungsten_carbide_recipe,
    category = (mods["Krastorio2"] and "smelting" or "smelting-carbon"),
    order = "z[tungsten-carbide]",
    icons = { mods.bobplates and 
      { icon = "__bobplates__/graphics/icons/plate/tungsten-carbide-plate.png", icon_size = 64}
      or { icon = "__bztungsten__/graphics/icons/tungsten-carbide.png", icon_size = 128}
    },
    enabled = false,
    energy_required = mods["Krastorio2"] and 48 or 64/3,
    ingredients = {{type="item", name="tungsten-plate", amount=mods["Krastorio2"] and 10 or 5}, mods["Krastorio2"] and {type="item", name="kr-coke", amount=5} or nil},
    results = {{type="item", name="tungsten-carbide", amount=mods["Krastorio2"] and 4 or 2}}
  },
})

data:extend({
  {
    type = "item",
    name = "rocket-engine-nozzle",
    icon = "__bztungsten__/graphics/icons/rocket-engine-nozzle.png",
    icon_size = 128,
    subgroup = "intermediate-product",
    order = "z[rocket-engine-nozzle]",
    stack_size = 100
  },
  {
    type = "recipe",
    name = "rocket-engine-nozzle",
    category = "crafting",
    subgroup = "intermediate-product",
    order = "z[rocket-engine-nozzle]",
    icons = {
          { icon = "__bztungsten__/graphics/icons/rocket-engine-nozzle.png", icon_size = 128}
    },
    enabled = false,
    energy_required = 5,
    ingredients =  {{type="item", name="tungsten-plate", amount=2}},
    results = {{type="item", name="rocket-engine-nozzle", amount=1}},
  }
})

if util.me.cuw() then
  data:extend({
    {
      type = "item",
      name = "cuw",
      icon = "__bztungsten__/graphics/icons/cuw.png",
      icon_size = 128,
      subgroup = "raw-material",
      order = "z[cuw]",
      stack_size = 100,
    },
    {
      type = "recipe",
      name = "cuw",
      category = "advanced-crafting",
      order = "z[cuw]",
      enabled = false,
      energy_required = 80,
      ingredients = {
        {type="item", name="tungsten-plate", amount=15},
        {type="item", name="copper-plate", amount=5},
      },
      results = {{type="item", name="cuw", amount=20}},
    },
  })
  util.add_unlock(util.me.tungsten_processing, "cuw")
end



if mods.DoubleFurnace then
data:extend({
  { type = "recipe-category", name = "double-smelting-carbon"},
})

data:extend({
  {
    type = "recipe",
    name = "double-tungsten",
    category = "double-smelting-carbon",
    enabled = false,
    energy_required = 32/3,
    ingredients =  {{type="item", name="tungsten-ore", amount=5}},
    results = {{type="item", name="tungsten-carbide", amount=1}},
  }
})
util.add_effect(util.me.tungsten_processing, {type = "unlock-recipe", recipe = "double-tungsten"})
end

