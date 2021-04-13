------------------------------------------------------------------
---- data.lua ----------------------------------------------------
------------------------------------------------------------------
-- here is where all the fixed references and functions are stored
------------------------------------------------------------------

-- Setup function host
local functions = {}

-- Subgroup generation function
function functions.make_subgroup(name, order)
	local subgroup = util.merge{data.raw["item-subgroup"]["fluid-network-placeholder"], {
		name = name,
		order = order,
	}}
	data:extend({subgroup})
end

-- Subgroup entity assignement function
function functions.assign_subgroup(item_name, item_subgroup, item_order)
	if data.raw.item[item_name] then
		data.raw.item[item_name].subgroup = item_subgroup
		if item_order then
			data.raw.item[item_name].order = item_order
		end
	end

	if data.raw.recipe[item_name] then
		data.raw.recipe[item_name].subgroup = item_subgroup
		if item_order then
			data.raw.recipe[item_name].order = item_order
		end
	end
end

-- Duplicate valve remove function
function functions.remove_bob_valve(old_valve)
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
function functions.assign_icon(name, type)
	local icon_path = "__flow-control-expanded-bob__/graphics/icon/base/"
	if mods ["reskins-bobs"] then icon_path = "__flow-control-expanded-bob__/graphics/icon/reskin/" end

	data.raw.item[name].icon =  icon_path..name..".png"
	data.raw.item[name].icon_size = 64
	data.raw[type][name].icon =  icon_path..name..".png"
	data.raw[type][name].icon_size = 64
end

-- Technology add function
function functions.add_tech(technology, recipe)
	table.insert(data.raw.technology[technology].effects,{type = "unlock-recipe", recipe = recipe})
end

-- Reskin flow-bob valves function
function functions.reskin_valve(valve_name)
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

return functions