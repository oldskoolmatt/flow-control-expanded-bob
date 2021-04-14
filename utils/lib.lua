-----------------------------------------------------------------------
------ INFINITE THANKS TO KIRAZY FOR THE HELP AND DOCUMENTATION  ------
--------------- https://mods.factorio.com/user/Kirazy -----------------
-----------------------------------------------------------------------

-----------------------------------------------------------------------
------- here is where all the fixed references and functions are stored
-----------------------------------------------------------------------

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

-- Remove entity function
function functions.remove_entity(entity_name, tech_name, entity)
	if data.raw.technology[tech_name] and data.raw.technology[tech_name].effects then
		for i, effect in pairs(data.raw.technology[tech_name].effects) do
			if effect.type == "unlock-recipe" and effect.recipe == entity_name then
				table.remove(data.raw.technology[tech_name].effects,i)
				data.raw.recipe[entity_name] = nil
				data.raw.item[entity_name] = nil
				data.raw[entity][entity_name] = nil
			end
		end
	elseif data.raw.item[entity_name] then
		data.raw.recipe[entity_name] = nil
		data.raw.item[entity_name] = nil
		data.raw[entity][entity_name] = nil
	end
end

-- Assign icon function
function functions.assign_icon(name, type)
	local icon_path = "__flow-control-expanded-bob__/graphics/icon/base/"
	if mods["reskins-bobs"] then icon_path = "__flow-control-expanded-bob__/graphics/icon/reskin/" end

	data.raw.item[name].icon =  icon_path..name..".png"
	data.raw.item[name].icon_size = 64
	data.raw[type][name].icon =  icon_path..name..".png"
	data.raw[type][name].icon_size = 64
end

-- Technology add function
function functions.add_tech(technology, recipe)
	table.insert(data.raw.technology[technology].effects,{type = "unlock-recipe", recipe = recipe})
end

return functions
