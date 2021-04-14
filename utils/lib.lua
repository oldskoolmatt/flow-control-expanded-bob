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

-- Remove hidden flag function
function functions.remove_hidden_flag(item_name)
	if data.raw.item[item_name] and data.raw.item[item_name].flags then
		for i, flag in pairs(data.raw.item[item_name].flags) do
			if flag == "hidden" then
				table.remove(data.raw.item[item_name].flags, i)
			end
		end
	end
	if data.raw.recipe[item_name] then
		data.raw.recipe[item_name].hidden = false
	end
end

-- Ingredient swap function [DOES NOT CHECK FOR DUPLICATES]
function functions.replace_recipe_ingredient(old_item, new_item)
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

-- Assign icon function
function functions.assign_icon(name, type)
	local icon_path = "__flow-control-expanded-bob__/graphics/icon/base/"
	if mods ["reskins-bobs"] then icon_path = "__flow-control-expanded-bob__/graphics/icon/reskin/" end

	data.raw.item[name].icon =  icon_path..name..".png"
	data.raw.item[name].icon_size = 64
	data.raw[type][name].icon =  icon_path..name..".png"
	data.raw[type][name].icon_size = 64
end

-- Add recipe to tech function
function functions.add_tech(recipe, technology)
	table.insert(data.raw.technology[technology].effects,{type = "unlock-recipe", recipe = recipe})
end

-- Remove recipe from tech function
function functions.rem_tech(recipe, tech_name)
	if tech_name ~= nil and data.raw.technology[tech_name] and data.raw.technology[tech_name].effects then
		for i, effect in pairs(data.raw.technology[tech_name].effects) do
			if effect.type == "unlock-recipe" and effect.recipe == recipe then
				table.remove(data.raw.technology[tech_name].effects,i)
			end
		end
	end
end

return functions