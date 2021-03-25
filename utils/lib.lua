---------------------------------------------------------------------
---- data.lua -------------------------------------------------------
---------------------------------------------------------------------
-- here is where all of the fixed references and functions are stored
---------------------------------------------------------------------

-- groups
data:extend
({
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

----------------------------------

-- Subgroup generation function
function flow_bob_make_subgroup(name, order)
	local make_subgroup = util.table.deepcopy(data.raw["item-subgroup"]["fluid-network-placeholder"])
	make_subgroup.name = name
	make_subgroup.order = order
	data:extend({make_subgroup})
end

-- Subgroup entity assignement function
function flow_bob_assign_assign_subgroup(item_name, item_subgroup, item_order)
	if data.raw.item and data.raw.item[item_name] then
		data.raw.item[item_name].subgroup = item_subgroup
		if item_order ~= nil then
			data.raw.item[item_name].order = item_order
		end
	end
	if data.raw.recipe and data.raw.recipe[item_name] then
		data.raw.recipe[item_name].subgroup = item_subgroup
		if item_order ~= nil then
			data.raw.recipe[item_name].order = item_order
		end
	end
end

-- Duplicate valve remove function
function flow_bob_remove_bob_valve(old_valve)
	for i = 1, #data.raw.technology["fluid-handling"].effects do
		effect = data.raw.technology["fluid-handling"].effects[i]
		if effect.type == "unlock-recipe" and effect.recipe == old_valve then
			index = i
		end
	end
	table.remove(data.raw.technology["fluid-handling"].effects, index)
	data.raw.recipe[old_valve] = nil
	data.raw.item[old_valve] = nil
	data.raw["storage-tank"][old_valve] = nil
end

-- Reskin flow-bob valves
function flow_bob_reskin_valve(valve_name)
	local icon_path = "__flow-control-expanded-bob__/graphics/icon/valve/reskin/"
	local sheet_path = "__flow-control-expanded-bob__/graphics/entity/valve/reskin/"
	data.raw["storage-tank"][valve_name].pictures.picture.sheet.filename = sheet_path .. valve_name ..".png"
	data.raw["storage-tank"][valve_name].pictures.picture.sheet.priority = "extra-high"
	data.raw["storage-tank"][valve_name].pictures.picture.sheet.frames = 4
	data.raw["storage-tank"][valve_name].pictures.picture.sheet.width = 128
	data.raw["storage-tank"][valve_name].pictures.picture.sheet.height = 128
	data.raw["storage-tank"][valve_name].pictures.picture.sheet.scale = 0.5
	data.raw.item[valve_name].icon = icon_path .. valve_name .. ".png"
	data.raw.item[valve_name].icon_size = 64
	data.raw.item[valve_name].icon_mipmaps = 4
end