------------------------------
---- data-final-fixes.lua ----
------------------------------

-- Fetch functions from library
local add_tech_recipe_unlock = bobmods.lib.tech.add_recipe_unlock
local remove_tech_recipe_unlock = bobmods.lib.tech.remove_recipe_unlock

-- Adjusts valve unlocking for petrochem
if mods ["angelspetrochem"] then

	local valve_list =
	{
	"flowbob-check-valve",
	"flowbob-overflow-valve",
	"flowbob-topup-valve-1",
	"flowbob-topup-valve-2",
	}

	-- Reassign recipes to new tech and remove recipes from old techs
	for _, valve in pairs(valve_list) do
		add_tech_recipe_unlock("angels-fluid-control",	valve)
		remove_tech_recipe_unlock("fluid-handling",		valve)
	end
end
