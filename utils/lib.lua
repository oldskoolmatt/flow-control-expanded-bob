------------------------------------------------------------------
---- data.lua ----------------------------------------------------
------------------------------------------------------------------
-- here is where all the fixed references and functions are stored
------------------------------------------------------------------

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

-- Define paths
if mods ["reskins-bobs"] then
	flow_bob_picture_path = "__reskins-bobs__/graphics/entity/logistics/pipe/"
	flow_bob_icon_path = "__flow-control-expanded-bob__/graphics/icon/reskin/"
	flow_bob_covers_path = "__reskins-bobs__/graphics/entity/logistics/pipe-covers/"
else
	flow_bob_picture_path = "__boblogistics__/graphics/entity/pipe/"
	flow_bob_icon_path = "__flow-control-expanded-bob__/graphics/icon/base/"
	flow_bob_covers_path = "__boblogistics__/graphics/entity/pipe/"
end
flow_bob_shadow_covers_path = "__base__/graphics/entity/pipe-covers"

-- Subgroup generation function
function flow_bob_make_subgroup(name, order)
	local make_subgroup = util.table.deepcopy(data.raw["item-subgroup"]["fluid-network-placeholder"])
	make_subgroup.name = name
	make_subgroup.order = order
	data:extend({make_subgroup})
end

-- Subgroup entity assignement function
function flow_bob_assign_subgroup(item_name, item_subgroup, item_order)
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
	if old_valve == "bob-valve" then
		data.raw.recipe["bob-valve"] = nil
		data.raw.item["bob-valve"] = nil
		data.raw["storage-tank"]["bob-valve"] = nil
	elseif data.raw.technology["fluid-handling"] and data.raw.technology["fluid-handling"].effects then
		for i, effect in pairs(data.raw.technology["fluid-handling"].effects) do
			if effect.type == "unlock-recipe" and effect.recipe == old_valve then
				table.remove(data.raw.technology["fluid-handling"].effects,i)
				data.raw.recipe[old_valve] = nil
				data.raw.item[old_valve] = nil
				data.raw["storage-tank"][old_valve] = nil
			end
		end
	end
end

-- Assign icon function
function flow_bob_assign_icon(item_name, type)
	data.raw.item[item_name].icon =  flow_bob_icon_path .. item_name .. ".png"
	data.raw.item[item_name].icon_size = 64
	data.raw.item[item_name].scale = 0.5
	data.raw[type][item_name].icon =  flow_bob_icon_path .. item_name .. ".png"
	data.raw[type][item_name].icon_size = 64
	data.raw[type][item_name].scale = 0.5
end

-- Technology add function
function flow_bob_add_tech(technology, recipe)
	table.insert(data.raw.technology[technology].effects,{type = "unlock-recipe", recipe = recipe})
end

-- Reskin flow-bob valves function
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