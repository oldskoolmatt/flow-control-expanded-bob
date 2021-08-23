------------------------------
---- data-final-fixes.lua ----
------------------------------

-- Fetch functions from library
local replace_ingredient = require("utils.lib").replace_recipe_ingredient_ALL
local nuke_entity = require("utils.lib").nuke_entity
local add_tech_recipe_unlock = bobmods.lib.tech.add_recipe_unlock
local remove_tech_recipe_unlock = bobmods.lib.tech.remove_recipe_unlock

local valve_list =
{
	["bob-valve"] = "flowbob-check-valve", -- Bob
	["bob-overflow-valve"] = "flowbob-overflow-valve", -- Bob
	["bob-topup-valve"] = "flowbob-topup-valve-1", -- Bob
	["valve-return"] = "flowbob-check-valve", -- Angels
	["valve-overflow"] = "flowbob-overflow-valve", -- Angels
	["valve-underflow"] = "flowbob-topup-valve-2", -- Angels
	["check-valve"] = "flowbob-check-valve", -- Flow Control
	["overflow-valve"] = "flowbob-overflow-valve", -- Flow Control
	["underflow-valve"] = "flowbob-topup-valve-2" -- Flow Control
}

-- Scans all recipes and replaces duplicate valves used as ingredients in other recipes
-- Scans all technologies and removes any unlock reference to the duplicate valves
-- Nukes the duplicate valves away from Nauvis, FOREVER!
for old_valve, new_valve in pairs(valve_list) do
	replace_ingredient(old_valve, new_valve)
	nuke_entity(old_valve)
end

-- Adjusts valve unlocking for petrochem
if mods ["angelspetrochem"] then
	-- Reassign valves to tech
	add_tech_recipe_unlock("angels-fluid-control",		"flowbob-check-valve")
	add_tech_recipe_unlock("angels-fluid-control",		"flowbob-overflow-valve")
	add_tech_recipe_unlock("angels-fluid-control",		"flowbob-topup-valve-1")
	add_tech_recipe_unlock("angels-fluid-control",		"flowbob-topup-valve-2")
	-- Remove recipes from old techs
	remove_tech_recipe_unlock("fluid-handling",		"flowbob-check-valve")
	remove_tech_recipe_unlock("fluid-handling",		"flowbob-overflow-valve")
	remove_tech_recipe_unlock("fluid-handling",		"flowbob-topup-valve-1")
	remove_tech_recipe_unlock("fluid-handling",		"flowbob-topup-valve-2")
end
