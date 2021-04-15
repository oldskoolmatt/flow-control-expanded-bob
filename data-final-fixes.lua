-----------------------------------------------------------------------
------ INFINITE THANKS TO KIRAZY FOR THE HELP AND DOCUMENTATION  ------
--------------- https://mods.factorio.com/user/Kirazy -----------------
-----------------------------------------------------------------------

------------------------------
---- data-final-fixes.lua ----
------------------------------

-- Fetch functions from library
local rem_tech = require("utils.lib").rem_tech
local rem_hide = require("utils.lib").remove_hidden_flag
local remove_entity = require("utils.lib").remove_entity
local replace_ingredient = require("utils.lib").replace_recipe_ingredient

-- Replaces valves in case they're used as ingredients
replace_ingredient("check-valve",		"bob-valve")
replace_ingredient("overflow-valve",	"bob-overflow-valve")
replace_ingredient("underflow-valve",	"bob-topup-valve")
replace_ingredient("valve-return",		"bob-valve")
replace_ingredient("valve-overflow",	"bob-overflow-valve")
replace_ingredient("valve-underflow",	"bob-topup-valve")

-- Remove hidden flag from bob valves
rem_hide("bob-valve")
rem_hide("bob-overflow-valve")
rem_hide("bob-topup-valve")

-- Remove duplicate valves
local entity = "storage-tank"

remove_entity("check-valve",		"fluid-handling", entity)
remove_entity("overflow-valve",		"fluid-handling", entity)
remove_entity("underflow-valve",	"fluid-handling", entity)

-- Apply overrides
require ("prototypes.override.angels-final-overrides")
require ("prototypes.override.grouping-overrides")
require ("prototypes.override.final-overrides")

