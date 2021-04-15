-----------------------------------------------------------------------
------ INFINITE THANKS TO KIRAZY FOR THE HELP AND DOCUMENTATION  ------
--------------- https://mods.factorio.com/user/Kirazy -----------------
-----------------------------------------------------------------------

------------------------------
---- data-final-fixes.lua ----
------------------------------

-- Fetch functions from library
local add_tech = require("utils.lib").add_tech
local rem_tech = require("utils.lib").rem_tech
local hide_entity = require("utils.lib").hide_entity

-- Angels petrochem
if mods ["angelspetrochem"] then

	-- Remove duplicate valves
	hide_entity("valve-overflow",	"angels-fluid-control")
	hide_entity("valve-return",		"angels-fluid-control")
	hide_entity("valve-underflow",	"angels-fluid-control")

	-- Reassign valves to tech
	add_tech("bob-valve",				"angels-fluid-control")
	add_tech("bob-overflow-valve",		"angels-fluid-control")
	add_tech("bob-topup-valve",			"angels-fluid-control")
	add_tech("flowbob-topup-valve",		"angels-fluid-control")

	-- Remove recipes from obsolete techs
	rem_tech("flowbob-topup-valve",		"fluid-handling")
end