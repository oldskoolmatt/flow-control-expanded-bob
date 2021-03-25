-- Initialise mod library
require("utils.lib")

-- Replace bob top-up valve
local icon_path = "__flow-control-expanded-bob__/graphics/"

local underflow_valve_2 = util.table.deepcopy(data.raw.item["overflow-valve"]) -- Item
underflow_valve_2.name = "underflow-valve-2"
underflow_valve_2.icon = icon_path .. "icon/valve/underflow-valve-2.png"
underflow_valve_2.place_result = "underflow-valve-2"
data:extend({underflow_valve_2})

local underflow_valve_2 = util.table.deepcopy(data.raw.recipe["overflow-valve"]) -- Recipe
underflow_valve_2.name = "underflow-valve-2"
underflow_valve_2.result = "underflow-valve-2"
data:extend({underflow_valve_2})

local underflow_valve_2 = util.table.deepcopy(data.raw["storage-tank"]["overflow-valve"]) -- Entity
underflow_valve_2.name = "underflow-valve-2"
underflow_valve_2.minable.result = "underflow-valve-2"
underflow_valve_2.fluid_box.base_level = -0.8
underflow_valve_2.pictures.picture.sheet.filename = icon_path .. "entity/valve/underflow-valve-2.png"
data:extend({underflow_valve_2})

table.insert(data.raw["technology"]["fluid-handling"].effects, {type = "unlock-recipe",recipe = "underflow-valve-2"}) -- Tech