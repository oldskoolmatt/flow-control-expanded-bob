------------------
---- data.lua ----
------------------

-- Load the: SUPER-DUPER-VALVE-NUKER
require("utils.super-duper-valve-nuker")

-- Load prototypes
require("prototypes.flowbob-pipes")
require("prototypes.flowbob-valves")
require("prototypes.reskin")

-- Make item group
local item_group =
{
	type = "item-group",
	name = "fluid-network",
	icon = "__base__/graphics/icons/storage-tank.png",
	icon_size = 64,
	icon_mipmaps = 4,
	inventory_order = "c-b",
	order = "aaa-b"
}	data:extend({item_group})
