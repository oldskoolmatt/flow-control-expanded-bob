------------------
---- data.lua ----
------------------

-- Setup crafting tabs
data:extend({
	{
		type = "item-group",
		name = "fluid-network",
		icon = "__base__/graphics/icons/storage-tank.png",
		icon_size = 64,
		icon_mipmaps = 4,
		inventory_order = "c-b",
		order = "aaa-b"
	},
	{
		group = "fluid-network",
		type = "item-subgroup",
		name = "fluid-network-placeholder",
	}
})

-- Create valve set and remove flow control duplicates
require("prototypes.flowbob-valves")
