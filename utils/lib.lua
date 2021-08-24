-----------------------------------------------------------------------
------ INFINITE THANKS TO KIRAZY FOR THE HELP AND DOCUMENTATION  ------
--------------- https://mods.factorio.com/user/Kirazy -----------------
-----------------------------------------------------------------------

-- Setup function host
local functions = {}

-- Subgroup generation
function functions.make_subgroup(name, order)
	local item_subgroup =
	{
		group = "fluid-network",
		type = "item-subgroup",
		name = name,
		order = order,
	}	data:extend({item_subgroup})
end

-- Subgroup entity assignement
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

-- Sets up the correct icons and paths for vanilla and logistics pipes
function functions.assign_icon(name, type)
	local icon_path = "__flow-control-expanded-bob__/graphics/icon/base/"

	data.raw.item[name].icon =  icon_path..name..".png"
	data.raw.item[name].icon_size = 64
	data.raw[type][name].icon =  icon_path..name..".png"
	data.raw[type][name].icon_size = 64
end

-- Returns the full pipe_pictures definition for a given material, sourced from the appropriate mod
function functions.get_pipe_pictures(material)
	if mods["reskins-bobs"] then
		return reskins.lib.pipe_pictures({mod = "bobs", group = "logistics", material = material})
	else
		return bob_pipepictures(material)
	end
end

-- Returns the full pipe_covers definition for a given material, sourced from the appropriate mod
function functions.get_pipe_covers(material)
	if mods["reskins-bobs"] then
		return reskins.lib.pipe_covers({mod = "bobs", group = "logistics", material = material})
	else
		return bob_pipecoverspictures(material)
	end
end

-- Creates the appropripate unique pipe_type item, recipe, and entity definitions
function functions.create_extensible_prototype_definitions(pipe_type, material)
	local flow_pipe_name = "pipe-"..material.."-"..pipe_type
	local health = data.raw.pipe[material.."-pipe"] and data.raw.pipe[material.."-pipe"].max_health or 100 -- 100 is fallback, but in theory is never used
	return
	{
		item = util.merge{data.raw.item["pipe-"..pipe_type],
		{
			name = flow_pipe_name,
			place_result = flow_pipe_name
		}
	},

		recipe = util.merge{data.raw.recipe["pipe-"..pipe_type],
		{
			name = flow_pipe_name,
			result = flow_pipe_name
		}
	},

		entity = util.merge{data.raw["storage-tank"]["pipe-"..pipe_type],
		{
			name = flow_pipe_name,
			minable = {result = material.."-pipe"},
			max_health = health
		}
	}
}
end

-- Scans all technologies and removes recipe unlock
function functions.remove_recipe_unlock_ALL(entity_name)
	-- Scans all techs and removes recipe unlock references
	for _, technology in pairs(data.raw.technology) do

		local effects = technology.effects

		if effects then
			for i, effect in pairs(effects) do
				if effect.type == "unlock-recipe" and effect.recipe == entity_name then
					table.remove(technology.effects, i)
				end
            end
        end
    end
end

-- Scans all recipes and replaces ingredient [DOES NOT CHECK FOR DUPLICATES]
function functions.replace_recipe_ingredient_ALL(old_item, new_item)
    -- Search the recipe table
    for _, recipe in pairs(data.raw.recipe) do
        -- Fetch the ingredients list
        local normal_ingredients = recipe.normal and recipe.normal.ingredients or recipe.ingredients
        local expensive_ingredients = recipe.expensive and recipe.expensive.ingredients

        local function update_ingredient(ingredient)
            -- Fetch the current ingredient's name
            local name = ingredient.name or ingredient[1]

            -- Check if its a candidate for replacement
            if name == old_item then
                if ingredient.name then
                    ingredient.name = new_item
                else
                    ingredient[1] = new_item
                end
            end
        end

        -- Iterate through the normal ingredients, check for our old_item, and replace it if found
        if normal_ingredients then
            for _, ingredient in pairs(normal_ingredients) do
                update_ingredient(ingredient)
            end
        end

        -- Iterate through the expensive ingredients, check for our old_item, and replace it if found
        if expensive_ingredients then
            for _, ingredient in pairs(expensive_ingredients) do
                update_ingredient(ingredient)
            end
        end
    end
end

-- Nukes entities from the game
function functions.nuke_entity(old, new, entity_type)
	functions.remove_recipe_unlock_ALL(old)
	functions.replace_recipe_ingredient_ALL(old, new)

	-- Nukes the entity
	data.raw.recipe[old] = nil
	data.raw.item[old] = nil
	data.raw[entity_type][old] = nil
end

return functions